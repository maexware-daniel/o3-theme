import { readdir, copyFile, rm, mkdir, writeFile, readFile } from "fs/promises";
import path from "path";
import { spawn } from "child_process";
import Bun from "bun";
import chokidar from "chokidar";

const themeName = "pixelme";

const paths = {
    scss: "./build/scss/main.scss",
    scssDir: "./build/scss/",
    jsDir: "./build/js/",
    widgetJS: "./build/js/widget/",
    bootstrapJS: "./node_modules/bootstrap/dist/js/bootstrap.bundle.js",
    splideJS: "./node_modules/@splidejs/splide/dist/js/splide.js",
    splideMinJS: "./node_modules/@splidejs/splide/dist/js/splide.min.js",
    jquery: "./node_modules/jquery/dist/jquery.min.js",
    fonts: "./build/font/",
    favicon: "./build/favicon/",
    images: "./build/img/",
    templates: "./tpl/",
    translationDE: "./de/",
    translationEN: "./en/",
    thumbnail: "./build/theme.png",
    themeRootOut: "./out",
    tmp: "../../../tmp",
    projectRootOut: `../../../out/${themeName}`,
};

// 🧹 Clean Dev
async function cleanDev() {
    await rm(`${paths.tmp}/*`, { recursive: true, force: true }).catch(() => {});
    console.log("✅ Cleaned dev tmp folder.");
}

// 🧹 Clean Prod
async function cleanProd() {
    await Promise.all([
        rm(`${paths.tmp}/*`, { recursive: true, force: true }).catch(() => {}),
        rm(paths.themeRootOut, { recursive: true, force: true }).catch(() => {}),
        rm(paths.projectRootOut, { recursive: true, force: true }).catch(() => {}),
    ]);
    console.log("✅ Cleaned production directories.");
}

// 🎨 Compile SCSS to CSS
async function compileSCSS(minify = false) {
    await mkdir(`${paths.projectRootOut}/src/css`, { recursive: true });
    const outputFile = minify ? "style.min.css" : "style.css";
    const cmd = ["node_modules/.bin/sass", paths.scss, `${paths.projectRootOut}/src/css/${outputFile}`];

    if (minify) cmd.push("--style=compressed");
    spawn(cmd[0], cmd.slice(1), { stdio: "ignore" });

    console.log(`✅ Compiled SCSS (${minify ? "minified" : "dev"}).`);
}

// 🚀 Bundle & Minify JS
async function bundleJS(minify = false) {
    const outputDir = `${paths.projectRootOut}/src/js`;
    await mkdir(outputDir, { recursive: true });

    const jsFiles = await readdir(paths.jsDir, { withFileTypes: true }).then(files =>
        files.filter(file => file.isFile() && file.name.endsWith(".js")).map(file => path.join(paths.jsDir, file.name))
    );

    const entrypoints = [paths.bootstrapJS, ...jsFiles];

    if (entrypoints.length === 0) {
        console.error("❌ Keine JavaScript-Dateien gefunden.");
        return;
    }

    await Bun.build({
        entrypoints,
        outdir: outputDir,
        minify: minify,
        sourcemap: "inline",
    });

    console.log(`✅ JavaScript ${minify ? "minified" : "bundled"} successfully.`);
}

// 📦 Copy Static Files
async function copyDirectory(src, dest) {
    try {
        await mkdir(dest, { recursive: true });
        const entries = await readdir(src, { withFileTypes: true });

        for (const entry of entries) {
            const srcPath = path.join(src, entry.name);
            const destPath = path.join(dest, entry.name);

            if (entry.isDirectory()) {
                await copyDirectory(srcPath, destPath); // Rekursiver Kopiervorgang
            } else {
                await copyFile(srcPath, destPath);
            }
        }
        console.log(`✅ Copied directory: ${src} -> ${dest}`);
    } catch (err) {
        console.error(`❌ Error copying ${src}: ${err.message}`);
    }
}

async function copyAssets() {
    await Promise.all([
        copyFile(paths.thumbnail, `${paths.projectRootOut}/theme.png`).catch(err => console.error(`❌ Error copying theme.png: ${err.message}`)),
        copyDirectory(paths.fonts, `${paths.projectRootOut}/src/font`),
        copyDirectory(paths.favicon, `${paths.projectRootOut}/src/favicon`),
        copyDirectory(paths.images, `${paths.projectRootOut}/img`),
    ]);
    console.log("✅ Copied assets.");
}

// 👀 Watch Task
function watchFiles() {
    const watchedPaths = [paths.scssDir, paths.jsDir, paths.templates, paths.images];
    chokidar.watch(watchedPaths, { ignoreInitial: true, persistent: true }).on("all", async (event, filePath) => {
        console.log(`🔄 File changed: ${filePath}`);

        try {
            if (filePath.endsWith(".scss")) {
                await compileSCSS();
                console.log("✅ SCSS compiled successfully.");
            }
            if (filePath.endsWith(".js")) {
                await bundleJS();
                console.log("✅ JS bundled successfully.");
            }
        } catch (err) {
            console.error(`❌ Error processing file change: ${err.message}`);
        }
    }).on("error", (error) => {
        console.error(`❌ Watcher error: ${error}`);
    });
    console.log("👀 Watching for file changes...");
}

// 🔥 Run Tasks
async function dev() {
    await cleanDev();
    await compileSCSS();
    await bundleJS();
    await copyAssets();
    watchFiles();
}

async function prod() {
    await cleanProd();
    await compileSCSS(true);
    await bundleJS(true);
    await copyAssets();
}

const task = process.argv[2];
if (task === "dev") dev();
if (task === "prod") prod();
