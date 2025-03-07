# vim-laravel-projections

- `:Console` - Open the tinker console

## Commands

- `:Ebroadcast <arg>` - Open the given broadcast.
- `:Ecast <arg>` - Open the given cast.
- `:Ecommand <arg>` - Open the given console command.
- `:Ecomposer` - Open `composer.json`.
    - Call `:Make` while editing `composer.json` or `composer.lock` to run `composer install` via Dispatch.
- `:Econfig [arg]` - Open the given configuration file. With no argument provided, opens `config/app.php`.
- `:Econtroller <arg>` - Open the given controller.
- `:Ecss [arg]` - Open the given CSS file. With no argument provided, opens `resources/css/app.css`.
- `:Edoc [arg]` - Open the documentation file. With no argument provided, opens `README.md`.
- `:Edotenv [arg]` - Open the dotenv file for the given environment. With no argument provided, opens `.env`.
- `:Eenum` - Open the given enum.
- `:Eevent <arg>` - Open the given event.
- `:Eexception <arg>` - Open the given exception.
- `:Efacade <arg>` - Open the given facade.
- `:Efactory <arg>` - Open the given factory.
- `:Ejob <arg>` - Open the given job.
- `:Ejs [arg]` - Open the given JavaScript file. With no argument provided, opens `resources/js/app.js`.
- `:Elang <arg>` - Open the given language file.
- `:Elistener <arg>` - Open the given listener.
- `:Elivewire <arg>` - Open the given Livewire component.
- `:Elog <arg>` - Open the given log file.
- `:Email <arg>` - Open the given mail.
- `:Emiddleware <arg>` - Open the given middleware.
- `:Emigration <arg>` - Open the given DB migration.
    - Call `:Make` while editing a migration file to run `php artisan migrate` via Dispatch for that specific migration.
    - Call `:Dispatch` while editing a migration file to run `php artisan migrate` via Dispatch for all migrations.
- `:Emodel [arg]` - Open the given model.
    - Call `:Emodel` without arguments from inside a factory, seeder, observer, policy, or Unit test to open the model for the current file.
- `:Enotification <arg>` - Open the given notification.
- `:Enpm <arg>` - Open NPM `package.json` file.
    - Call `:Make` while editing `package.json` or `package-lock.json` to run `npm install` via Dispatch.
- `:Eobserver <arg>` - Open the given observer.
- `:Epolicy <arg>` - Open the given policy.
- `:Eprovider [arg]` - Open the given provider. With no argument provided, opens `AppServiceProvider`.
- `:Erepository <arg>` - Open the given repository.
- `:Erequest <arg>` - Open the given form request.
- `:Eresource <arg>` - Open the given API resource.
- `:Eroute [arg]` - Open the given route file. With no argument provided, opens `web`.
- `:Erule <arg>` - Open the given rule.
- `:Escope <arg>` - Open the given scope.
- `:Escript <arg>` - Open the given script.
- `:Eseeder [arg]` - Open the given seeder. With no argument provided, opens `DatabaseSeeder`.
    - Call `:Make` while editing a seeder file to run `php artisan db:seed` via Dispatch for that specific seeder.
    - Call `:Dispatch` while editing a seeder file to run `php artisan seed` via Dispatch for the default `DatabaseSeeder`.
- `:Eservice <arg>` - Open the given service.
- `:Etailwind` - Open the Tailwind CSS configuration file.
- `:Etest <arg>` - Open the given test.
    - Call `:Dispatch` or `:Make` while editing a test file to run the test with `php artisan test {file}` via Dispatch.
- `:Etrait <arg>` - Open the given trait.
- `:Eview <arg>` - Open the given view.
- `:Evite` - Open the Vite configuration file.
    - Run `:Make` while editing `vite.config.js` to run `npm run build` via Dispatch.
    - Run `:Start` while editing `vite.config.js` to run `npx run dev` via Dispatch.
- `:Eworkflow [arg]` - Open the given GitHub workflow. With no argument provided, opens `.github/workflows/ci.yml`.

## Alternate Files

Alternate files allow you to use `:A` to switch between the main file and an alternate. A common use case is to switch between a class and its test file.

- `app/*.php` - Open the corresponding test file under `tests/Feature/` or `tests/Unit/`.
- `tests/{Feature,Unit}/*Test.php` - Open the corresponding class file under `app/`.
- `routes/web.php` - Open the API route file (`routes/api.php`).
- `.env` - Open the `.env.example` file.
    - `.env.example` - Open the `.env` file.
- `composer.json` - Open `composer.lock`.
    - `composer.lock` - Open `composer.json`.
- `package.json` - Open `package-lock.json`.
    - `package-lock.json` - Open `package.json`.

This also lets you access `:E*` projection commands for the alternate file.

For example, if you are editing `app/Models/User.php`, you can use `:Etest` to switch to `tests/Feature/Models/UserTest.php`; from in `UserTest.php`, you can use `:Emodel` to switch back to `app/Models/User.php`.

- `app/*.php`:
    - `:Etest`
- `app/Models/`:
    - `:Efactory`
    - `:Eseeder`
    - `:Eobserver`
    - `:Epolicy`

## Templates

A few templates are provided for creating new files through Projectionist.
That happens when you use an `:E*` command for a file that doesn't exist yet,
or use `:A` to switch to a non-existent alternate file. If you manually create
a file, you can run `:AD` to replace the buffer contents with the new file
template.

By default, `*.php` files will just contain a `declare(strict_types=1);`
statement at the top.

Files under `app/*.php` will also include a namespace declaration based on the
file path. For example, creating a new file `app/Models/User.php` will include
the line `namespace App\Models;`.
