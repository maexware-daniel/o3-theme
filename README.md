
# O3 Theme

## 1. General Information

**O3 Theme** is a responsive theme for all O3 Shop editions.

### Key Features
- Bootstrap 5.3.8
- Custom build process (Gulp)
- PurgeCSS for optimized CSS output
- SplideJS for sliders

## 2. Installation

Choose the appropriate installation method based on your use case.

---

### Method A: Composer Installation (Production)

**Use this method if:** You want to use the theme as-is without modifications.

#### Step 1: Install via Composer

```bash
composer require o3-shop/o3-theme
```


#### Step 2: Copy Assets to Out Directory

```bash
cp -r <DOCUMENT_ROOT>/source/Application/views/o3-theme/out/o3-theme \
      <DOCUMENT_ROOT>/source/out/
```

> **Important:**
> - Copy the entire `o3-theme` directory, not just its contents
> - The target should be `source/out/o3-theme/`, not `source/out/` directly

#### Step 3: Prepare the Database

In order to install the theme options, import the `setup.sql` (to be found in `source/Application/views/o3-theme`) into your database.

**Option 1: Command Line**
```bash
mysql -u MYSQL_USER -p SHOP_DATABASE < setup.sql
```

**Option 2: Shop Admin Interface**
1. Log into Shop Admin
2. Navigate to **Service → Tools**
3. Upload `source/Application/views/o3-theme/setup.sql`
4. Click **"Start Update"** button

#### Step 3: Activate Theme

1. Log into Shop Admin
2. Navigate to **Extensions → Themes**
3. Find **O3 Theme** and click **Activate**

**✅ Installation complete!** The theme is now active.

---

### Method B: Git Clone (Development)

**Use this method if:** You want to customize the theme or develop new features.

| Requirement | Minimum Version | Notes |
|------------|----------------|-------|
| Node.js | v22.13.0 | [Download](https://nodejs.org/) |
| npm | 10.x | Included with Node.js |
| Gulp CLI | 3.0.0 | [Download](https://gulpjs.com/) |

#### Step 1: Clone Repository

```bash
cd <DOCUMENT_ROOT>/source/Application/views
git clone https://gitlab.maexware-solutions.de/o3/o3-theme.git
```

#### Step 2: Copy Assets to Out Directory

```bash
cp -r <DOCUMENT_ROOT>/source/Application/views/o3-theme/out/o3-theme \
      <DOCUMENT_ROOT>/source/out/
```

> **Important:**
> - Copy the entire `o3-theme` directory, not just its contents
> - The target should be `source/out/o3-theme/`, not `source/out/` directly

#### Step 3: Install Build Tools

**3.1 Install Node.js & npm**

**Ubuntu/Debian:**
```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs
```

**Other Systems:**  
Download from [nodejs.org](https://nodejs.org/)

**Verify Installation:**
```bash
node --version  # Should show v22.13.0 or higher
npm --version   # Should show 10.x or higher
```

**3.2 Install Gulp CLI Globally**
```bash
npm install --global gulp-cli
```

**3.3 Install Theme Dependencies**
```bash
cd <DOCUMENT_ROOT>/source/Application/views/o3-theme/
npm install
```

#### Step 4: Prepare the Database

Import the database setup (same as Composer method):

**Command Line:**
```bash
mysql -u MYSQL_USER -p SHOP_DATABASE < setup.sql
```

**Or via Shop Admin:** Service → Tools → Upload `setup.sql`

#### Step 5: Activate Theme

1. Log into Shop Admin
2. Navigate to **Extensions → Themes**
3. Find **O3 Theme** and click **Activate**

**✅ Installation complete!** You can now start developing.

---

## 3. Development

All source files for CSS and JavaScript are located in the `build/` directory.

### Available Commands

Run these commands from the theme root directory:

| Command | Description | Use Case |
|---------|-------------|----------|
| `gulp` | Production build | Minified JS/CSS with PurgeCSS |
| `gulp dev` | Development watcher | Auto-rebuild on changes + TMP cleanup |

### Development Workflow

**Start the watcher:**
```bash
gulp dev
```

> **💡 Tip:** Disable **Production Mode** in OXID Admin during development to keep source maps and unminified assets.
>
> Master Data → Basic Settings → Basic → Production mode → Off

The watcher monitors:
- `build/js/**/*.js` → Rebuilds JavaScript bundles
- `build/scss/**/*.scss` → Rebuilds CSS
- `**/*.tpl` → Clears OXID TMP directory
- `Application/translations/**/*.php` → Clears OXID TMP directory

**Production build:**
```bash
gulp
```

This will:
- Minify JavaScript and CSS
- Remove unused CSS with PurgeCSS
- Optimize assets for production

### PurgeCSS Safelist

PurgeCSS removes unused CSS classes. If you dynamically generate class names in JavaScript or templates, add them to the safelist.

**Example dynamic classes:**
```smarty
{* Template with dynamic class *}
<div class="[{$type}]-view"></div>
```

**Add to safelist in `gulpfile.js`:**
```javascript
safelist: [
    'grid-view',    // Add your dynamic classes here
    'line-view',
    /^custom-/,        // Or use patterns
]
```

**Location:** Line ~81 in `gulpfile.js` in the PurgeCSS configuration.

---

## 5. Asset Integration

### JavaScript
- Main JS bundle:   
  ``<DOCUMENT_ROOT>/source/Application/views/o3-theme/build/js/main.bundle.js``
- ``import`` new scripts here to include them in the **main JS**.
- Files in `build/js/widgets/` are standalone and must be explicitly loaded in templates:
  ``[{oxscript include="js/widgets/checkagb.js" priority=10}]``
> JavaScript from modules can also be integrated into ``main.bundle.js``. Descriptions and examples can be found in the bundle-file.

### SCSS


- Main SCSS bundle:  
  ``<DOCUMENT_ROOT>/source/Application/views/o3-theme/build/scss/main.bundle.scss``
- ``@import`` new styles here to include them globally.

> CSS/SCSS from the modules can also be integrated into ``main.bundle.scss``. Descriptions and examples can be found in the bundle-file.

---

## 6. jQuery

- This theme uses Bootstrap 5.3.8, which means that vanilla JS is used instead of jQuery.
- If jQuery is absolutely necessary, enable it in theme settings (same version as theme wave).
- Deprecation warnings during build are harmless and will disappear when updating Bootstrap.


## 7. Compatibility with PayPal
The PayPal module checks the active theme ID in one of its templates:
``[{if $oViewConf->getActiveTheme()=='flow'}]`` 
Change ``'flow'`` to ``'o3-theme'`` for compatibility.


## 8. Issues

Please forward all issues to https://issues.o3-shop.com/ for the project **O3 Theme**.