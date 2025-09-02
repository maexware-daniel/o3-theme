import gulp from 'gulp';
import gulpSass from 'gulp-sass';
import * as sass from 'sass';
import terser from 'gulp-terser';
import concat from 'gulp-concat';
import cleanCSS from 'gulp-clean-css';
import purgecss from 'gulp-purgecss';
import autoprefixer from 'gulp-autoprefixer';
import { deleteAsync } from 'del';
import postcss from 'gulp-postcss';
import sortMq from 'postcss-sort-media-queries';
import plumber from 'gulp-plumber';
import rename from 'gulp-rename';
import newer from 'gulp-newer';
import presetEnv from 'postcss-preset-env';
import notify from 'gulp-notify';
import fs from 'fs';
import compareBlocks from './gulp-compare-blocks.js';

const sassCompiler = gulpSass(sass);

const themeName = 'o3-theme';

const paths = {
    scss: `./build/scss/**/*.scss`,
    js: [`./build/js/**/*.js`, `!./build/js/widget/**/*.js`],
    widgetJS: `./build/js/widget/**/*.js`,
    bootstrapJS: `./node_modules/bootstrap/dist/js/bootstrap.bundle.js`,
    splideJS: `./node_modules/@splidejs/splide/dist/js/splide.js`,
    splideMinJS: `./node_modules/@splidejs/splide/dist/js/splide.min.js`,
    jquery: `./node_modules/jquery/dist/jquery.min.js`,
    fonts: `./build/font/**/*`,
    favicon: `./build/favicon/**/*`,
    images: `./build/img/**/*`,
    templates: `./tpl/**/*.tpl`,
    translationDE: `./de/**/*.php`,
    translationEN: `./en/**/*.php`,
    thumbnail: `./build/theme.png`,
    themeRootOut: `./out`,
    tmp: `../../../tmp`,
    projectRootOut: `../../../out`
};

// Error-Handling-Funktion
function onError(err) {
    const errorMessage = `${err.message}\n`;

    // Konsolenausgabe
    console.log(errorMessage);

    // Benachrichtigung (optional)
    notify.onError({
        title: 'Gulp Task Error',
        message: errorMessage,
        sound: 'Basso' // MacOS only, optional
    })(err);

    // Fehler-Logs in Datei schreiben
    fs.appendFileSync('gulp-error-log.txt', errorMessage);

    this.emit('end');
}

// Clean-Aufgabe für dev (löscht nur den Inhalt des tmp-Verzeichnisses)
gulp.task('clean:dev', () => {
    return deleteAsync([`${paths.tmp}/**/*`], { force: true });
});

// Clean-Aufgabe für prod (löscht den Inhalt des out-Verzeichnisses und des theme-Verzeichnisses in projectRootOut)
gulp.task('clean:prod', () => {
    return deleteAsync([`${paths.tmp}/**/*`, `${paths.themeRootOut}`, `${paths.projectRootOut}/${themeName}`], { force: true });
});

// SCSS kompilieren und CSS-Dateien für DEV
gulp.task('styles:dev', () => {
    return gulp.src(paths.scss, { sourcemaps: true })
        .pipe(plumber({ errorHandler: onError }))
        .pipe(sassCompiler().on('error', sassCompiler.logError))
        .pipe(autoprefixer())
        .pipe(concat('style.css'))
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/css`, { sourcemaps: '.' }));
});

// SCSS kompilieren und minifizieren für PROD
gulp.task('styles:prod', () => {
    // Unminifizierte Datei mit Sourcemap
    const unminified = gulp.src(paths.scss, { sourcemaps: true })
        .pipe(plumber({ errorHandler: onError }))
        .pipe(sassCompiler().on('error', sassCompiler.logError))
        .pipe(autoprefixer())
        .pipe(postcss([sortMq(), presetEnv({ stage: 2 })]))
        .pipe(rename('style.css'))
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/css`, { sourcemaps: '.' }))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}/src/css`, { sourcemaps: '.' }));

    // Minifizierte Datei ohne Sourcemap
    const minified = gulp.src(paths.scss)
        .pipe(plumber({ errorHandler: onError }))
        .pipe(sassCompiler().on('error', sassCompiler.logError))
        .pipe(autoprefixer())
        .pipe(postcss([sortMq(), presetEnv({ stage: 2 })]))
        .pipe(purgecss({
            content: [
                `tpl/**/*.tpl`,
                `build/js/**/*.js`
            ],
            safelist: {
                standard: [/^splide/, /^is-/, /backdrop/]
            }
        }))
        .pipe(cleanCSS())
        .pipe(rename('style.min.css'))
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/css`))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}/src/css`));

    return Promise.all([unminified, minified]);
});

// Javascript für DEV
gulp.task('scripts:dev', () => {
    return gulp.src([paths.bootstrapJS, ...paths.js], { sourcemaps: true })
        .pipe(plumber({ errorHandler: onError }))
        .pipe(concat('script.js'))
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/js`, { sourcemaps: '.' }));
});

// Javascript minifizieren für PROD
gulp.task('scripts:prod', () => {
    const allJsFiles = [paths.bootstrapJS, ...paths.js];

    // Unminifizierte Datei mit Sourcemap
    const unminified = gulp.src(allJsFiles, { sourcemaps: true })
        .pipe(plumber({ errorHandler: onError }))
        .pipe(concat('script.js')) // Zusammenführen aller Dateien
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/js`, { sourcemaps: '.' }))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}/src/js`, { sourcemaps: '.' }));

    // Minifizierte Datei ohne Sourcemap
    const minified = gulp.src(allJsFiles)
        .pipe(plumber({ errorHandler: onError }))
        .pipe(concat('script.js'))
        .pipe(terser({ ecma: 2015 }))
        .pipe(rename('script.min.js'))
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/js`))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}/src/js`));

    return Promise.all([unminified, minified]);
});

// Widget-JavaScript-Dateien für DEV
gulp.task('widgets:dev', () => {
    return gulp.src(paths.widgetJS)
        .pipe(plumber({ errorHandler: onError }))
        .pipe(newer(`${paths.projectRootOut}/${themeName}/src/js/widget`)) // Nur neue/aktualisierte Dateien kopieren
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/js/widget`));
});

// Widget-JavaScript-Dateien für PROD
gulp.task('widgets:prod', () => {
    return gulp.src(paths.widgetJS)
        .pipe(plumber({ errorHandler: onError }))
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/js/widget`))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}/src/js/widget`));
});

// Images kopieren für DEV
gulp.task('images:dev', () => {
    return gulp.src(paths.images, {encoding: false})
        .pipe(newer(`${paths.projectRootOut}/${themeName}/img`)) // Nur neue/aktualisierte Dateien kopieren
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/img`));
});

// Images kopieren für PROD
gulp.task('images:prod', () => {
    return gulp.src(paths.images, {encoding: false})
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/img`))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}/img`));
});

// Favicons kopieren für PROD
gulp.task('favicon:prod', () => {
    return gulp.src(paths.favicon, {encoding: false})
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/favicon`))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}/src/favicon`));
});

// Fonts kopieren für DEV
gulp.task('fonts:dev', () => {
    return gulp.src(paths.fonts, {encoding: false})
        .pipe(newer(`${paths.projectRootOut}/${themeName}/src/font`)) // Nur neue/aktualisierte Dateien kopieren
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/font`));
});

// Fonts kopieren für PROD
gulp.task('fonts:prod', () => {
    return gulp.src(paths.fonts, {encoding: false})
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/font`))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}/src/font`));
});

// Vendor kopieren für DEV
gulp.task('vendor:dev', () => {
    return gulp.src([paths.jquery, paths.splideJS, paths.splideMinJS]) // Beide Splide-Dateien und jQuery kopieren
        .pipe(newer(`${paths.projectRootOut}/${themeName}/src/vendor`)) // Nur neue/aktualisierte Dateien kopieren
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/vendor`));
});

// Vendor kopieren für PROD
gulp.task('vendor:prod', () => {
    return gulp.src([paths.jquery, paths.splideJS, paths.splideMinJS]) // Beide Splide-Dateien und jQuery kopieren
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}/src/vendor`))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}/src/vendor`));
});

// theme.png kopieren für PROD
gulp.task('thumbnail:prod', () => {
    return gulp.src(paths.thumbnail, {encoding: false})
        .pipe(gulp.dest(`${paths.projectRootOut}/${themeName}`))
        .pipe(gulp.dest(`${paths.themeRootOut}/${themeName}`));
});

gulp.task('blocks', async () => {
    await compareBlocks();
});

// Watch task für die DEV
gulp.task('watch', () => {
    gulp.watch(paths.scss, gulp.series('styles:dev'));
    gulp.watch(paths.js, gulp.series('scripts:dev'));
    gulp.watch(paths.widgetJS, gulp.series('widgets:dev'));
    gulp.watch(paths.templates, gulp.series('clean:dev'));
    gulp.watch(paths.images, gulp.series('images:dev'));
    gulp.watch(paths.translationDE, gulp.series('clean:dev'));
    gulp.watch(paths.translationEN, gulp.series('clean:dev'));
});

// Development Task
gulp.task('dev', gulp.series('clean:dev', 'styles:dev', 'scripts:dev', 'widgets:dev', 'fonts:dev', 'images:dev', 'vendor:dev', 'watch'));

// Production Task
gulp.task('prod', gulp.series('clean:prod', 'styles:prod', 'scripts:prod', 'widgets:prod', 'fonts:prod', 'thumbnail:prod', 'images:prod', 'vendor:prod', 'favicon:prod', 'blocks'));
