# O3 Theme

## General Information

*O3-Theme* is a responsive theme for all O3-Shop editions.

## Installation
If you want to extend the theme you need to clone the repository (see section development) as some soures are ignored on composer installation.

### Step 1: Get the source code

This step is only required if the theme is not delivered with the O3-Shop distribution.
```
composer require o3-shop/o3-theme
```

### Step 2: Prepare the database

In order to install the theme options, import the ``setup.sql`` (to be found in ``DOCUMENT_ROOT/source/Application/views/O3``) into your database.

#### Option 1: Console

``mysql -u MYSQL_USER -p SHOP_DATABASE < O3/setup.sql``

#### Option 2: Shop Admin: Service -> Tools

If you have a local copy of O3 files, go to Service -> Tools in Shop Admin, upload O3/setup.sql and click "start update" button

### Step 3: Activate theme

Log into the admin panel, go to *Extensions → Themes → O3* and press the *Activate* button. Clean the cache and off you go!

## Development

All *O3* theme related CSS/Javascript files can be found in theme's ``build`` directory. [Node v20.16.0](https://nodejs.org), [npm v10.9](https://www.npmjs.com) and [Gulp v5.0.0](https://gulpjs.com) are required to generate theme assets during development. **Make sure that you use at least the specified versions in your project**.

To get the development files you need to clone the repository

    cd DOCUMENT_ROOT/Application/views/
    git clone -b BRANCH_NAME https://gitlab.o3-shop.com/o3/o3-theme.git o3

1. To use ``gulp``, ``npm`` is required. Check ``nodejs`` website for installation
   instructions (https://nodejs.org/en/download/package-manager/). Example of
   Installation on ubuntu system:

    ```
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get install -y nodejs
    ```

2. Install ``gulp`` globally. Example:

    ```
    npm install --global gulp-cli
    ```

3. Go to "o3" theme's directory and install all related ``gulp`` plugins:

    ```
    cd DOCUMENT_ROOT/Application/views/o3/
    npm install
    ```
   > When installing node_modules, a warning is displayed ("1 moderate severity vulnerability") due to the old version of Jquery. If you want to change this to a newer version, make sure that you do not have any modules that are based on old Jquery functions.

4. Now its possible to regenerate "o3" theme assets by running ``gulp dev`` or ``gulp prod`` 
   task while being in "o3" directory.

## More info about the theme

To generate assets during development within ``htdocs/source/out/[THEME]``, you can use ``gulp dev``. The active watcher will regenerate CSS and JavaScript each time you save changes.

At the end of development, the ``gulp prod`` task should be run. This applies purgeCSS to the generated stylesheets to remove unused CSS. Additionally, assets will be placed not only in ``htdocs/source/out/[THEME]`` but also in ``htdocs/source/Application/views/[THEME]/out``.

### Production Mode
During development, production mode (in Oxid-Admin) should be disabled; otherwise, JavaScript and Stylesheets will load in minified form, and JavaScript and CSS maps will not be available.

### Bootstrap / jQuery
The theme uses Bootstrap version 5.3.3, which no longer relies on jQuery. As a result, jQuery has been removed from the theme. If jQuery is needed, it can be enabled in the theme settings. It is the same version as in theme 'wave'. If a different version is required, you can adjust this in package.json.
> Bootstrap generates "Deprecation Warnings" during the build process. These warnings will no longer appear once Bootstrap is updated to the latest version. However, Bootstrap remains fully usable in this state.


### Slider
Due to the theme's different slider requirements, [splideJS](https://splidejs.com/) is used instead of Bootstrap Carousel.

### Smarty Blocks
A few blocks are no longer present due to no longer needed TPL files. Additionally, there are now blocks that are present in multiple files. An overview can be found in `BLOCKS.md`.

### JavaScript
The files in `build/js` are combined into `main.js` using Gulp. Files in `build/js/widget` are not combined; they are loaded individually, but only when needed.

### Tooltips
Bootstrap’s tooltips are not active by default. Instead, the data-tooltip attribute can be used, for which stylesheets are set up. To use Bootstrap’s tooltips, they must be initialized. For more information, refer to [Bootstrap](https://getbootstrap.com/docs/5.3/components/tooltips/)

## Contributing

If you are interested in contributing of some changes, Please read [CONTRIBUTING.md](CONTRIBUTING.md) file for more information.

## Compatibility with modules

1. PayPal module
- The PayPal module contains in a tpl file a check for the theme id ```[{if $oViewConf->getActiveTheme()=='flow'}]``` which should be adjusted to O3

## Issues

Please forward all issues to https://issues.o3-shop.com/ for the project **O3 Theme**.