# Composer package for ProcessWire CMS installation

Using this package you can easily install ProcessWire to your project.
This works differenty from the official [processwire/processwire](https://packagist.org/packages/processwire/processwire) composer package,
where the official package just places the PW copy into `vendor/processwire/processwire`, this installs the PW directly
to the project's root (thanks to [uiii/pw-core](https://github.com/uiii/pw-core)).

## Why all this?
It is not easy (if event possible) to run PW instance with `wire` and `site` folders in different locations.
So if the PW is under `vendor` directory your `site` folder must too.

This package solves this by changing the PW install location to project's root next to your `site` folder.

## Usage

Just set the required PW version as composer dependency:

```
composer require uiii/processwire:<version>
```

If you **haven't** set up the PW yet (`site/assets/installed.php` doesn't exist), all files required for initial PW setup will be installed. Afterwards continue the setup in the browser.

If you **have** set up PW before and you have your `site` folder already, only the files required for running the site will be installed (`wire`, `index.php`, `.htaccess`).

> Old `index.php` and `.htaccess` will be backuped with `.bak` extension

**NOTE:** It is reasonable to config your VCS to ignore the `wire` directory.

Now when you deploy your site, you would install all your dependencies (PW included) with `composer install`.

### Updating existing installation

Updating is easy, just require new version: `composer require uiii/processwire:<new-version>`

### Reinstalling

If you need to reinstall PW from scratch, remove the `site/assets/install.php` file and reinstall composer package:

```
composer remove uiii/processwire
composer require uiii/processwire:<version>
