import fs from 'fs';
import path from 'path';
import { promisify } from 'util';

const readdir = promisify(fs.readdir);
const readFile = promisify(fs.readFile);
const writeFile = promisify(fs.writeFile);

const theme1Path = './tpl';
const theme2Path = '../wave/tpl';

async function extractBlocks(directory) {
    const blocks = {};
    const files = await getFiles(directory, '.tpl');

    for (const file of files) {
        const content = await readFile(file, 'utf-8');
        const matches = [...content.matchAll(/\{block\s+name=["']([\w\d_]+)["']/g)];

        matches.forEach(match => {
            const blockName = match[1];
            const relativePath = path.relative(directory, file);
            if (!blocks[blockName]) {
                blocks[blockName] = [];
            }
            blocks[blockName].push(relativePath);
        });
    }

    return blocks;
}

async function getFiles(directory, extension) {
    let files = [];
    const items = await readdir(directory, { withFileTypes: true });
    for (const item of items) {
        const fullPath = path.join(directory, item.name);
        if (item.isDirectory()) {
            files = files.concat(await getFiles(fullPath, extension));
        } else if (fullPath.endsWith(extension)) {
            files.push(fullPath);
        }
    }
    return files;
}

async function compareBlocks() {
    const theme1Blocks = await extractBlocks(theme1Path);
    const theme2Blocks = await extractBlocks(theme2Path);

    const missingInTheme1 = Object.keys(theme2Blocks).filter(
        blockName => !theme1Blocks[blockName]
    );

    const differentFiles = {};
    for (const blockName in theme1Blocks) {
        if (theme2Blocks[blockName] && theme1Blocks[blockName].join() !== theme2Blocks[blockName].join()) {
            differentFiles[blockName] = {
                O3: theme1Blocks[blockName],
                Wave: theme2Blocks[blockName]
            };
        }
    }

    // Anzahl fehlender Blöcke und unterschiedlicher Blöcke berechnen
    const missingCount = missingInTheme1.length;
    const differentBlockCount = Object.keys(differentFiles).length;

    // Generiere BLOCKS.md mit detaillierter Tabellenformatierung und Anzahl
    let markdownContent = `# Block Comparison Report\n\n`;

    // Tabelle für fehlende Blöcke mit Dateipfaden und Anzahl
    markdownContent += `## Missing blocks in Theme O3 (${missingCount}):\n`;
    if (missingCount > 0) {
        markdownContent += `\n| Block Name | Filepath in Wave |\n|------------|-------------------|\n`;
        missingInTheme1.forEach(blockName => {
            theme2Blocks[blockName].forEach(filePath => {
                markdownContent += `| ${blockName} | ${filePath} |\n`;
            });
        });
    } else {
        markdownContent += `\nNo missing blocks found.\n`;
    }

    // Tabelle für unterschiedliche Blöcke mit Dateipfaden und Anzahl
    markdownContent += `\n## Blocks with different files (${differentBlockCount}):\n`;
    if (differentBlockCount > 0) {
        markdownContent += `\n| Block Name | Files in O3 | Files in Wave |\n|------------|----------------|-----------------|\n`;
        for (const [blockName, files] of Object.entries(differentFiles)) {
            markdownContent += `| ${blockName} | ${files.O3.join(', ')} | ${files.Wave.join(', ')} |\n`;
        }
    } else {
        markdownContent += `\nNo differences in blocks found.\n`;
    }

    await writeFile('BLOCKS.md', markdownContent, 'utf-8');
    console.log('BLOCKS.md was successfully generated with a tabular structure and file paths.');
}

export default compareBlocks;
