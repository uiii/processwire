# Composer package for ProcessWire CMS installation

Using this package you can easily install ProcessWire to your project.
This works differenty from official [processwire/processwire](https://packagist.org/packages/processwire/processwire) composer package,
where the official package just installs the PW copy into `vendor/processwire/processwire` this installs the PW directly
to the project's root (see [uiii/pw-core](https://github.com/uiii/pw-core)).

## Why all this?
It is not easy (if event possible) to run PW instance with `wire` and `site` folders in different locations.
So if the PW is under `vendor` directory your `site` folder must too.

This package solves this by changing the PW install location to project's root where your `site` folder will likely be located too.

## Usage

Just set the required PW version as composer dependency:

```
composer require uiii/processwire:<version>
```

If you **haven't** created the `site` folder yet, all files required for PW installation will be present, so you can just run you web server and install PW the regular way.

If you already **have** the `site` folder, only the files required for running the site will be installed (`wire`, `index.php`, `.htaccess`).

> Old `index.php` and `.htaccess` will be backuped with `.bak` extension

**NOTE:** It is reasonable to ignore `wire` directory by your VCS.

Now when you deploy your site, you would install all your dependencies (PW included) with `composer install`.

### Updating existing installation

Updating is easy, just require new version: `composer require uiii/processwire:<new-version>`
