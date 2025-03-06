# vim-laravel-projections

- `:Console` - Open the tinker console

## Projections

- `Ebroadcast <arg>` - Open the given broadcast.
- `Ecast <arg>` - Open the given cast.
- `Ecommand <arg>` - Open the given console command.
- `Ecomposer` - Open `composer.json`.
    - Call `:Make` while editing `composer.json` to run `composer install` via Dispatch.
- `Ecomposerlock` - Open composer.lock.
    - Call `:Make` while editing `composer.lock` to run `composer install` via Dispatch.
- `Econfig [arg]` - Open the given configuration file. With no argument provided, opens `config/app.php`.
- `Econtroller <arg>` - Open the given controller.
- `Ecss [arg]` - Open the CSS given file. With no argument provided, opens `resources/css/app.css`.
- `Edoc [arg]` - Open the documentation file. With no argument provided, opens `README.md`.
- `Edotenv [arg]` - Open the dotenv file for the given environment. With no argument provided, opens `.env`.
- `Eenum` - Open the given enum.
- `Eevent [arg]` - Open the given event.
    - In a listener, call `:Eevent` without arguments to open the corresponding event.
- `Eexception <arg>` - Open the given exception.
- `Efacade <arg>` - Open the given facade.
- `Efactory <arg>` - Open the given factory.
- `Ejob <arg>` - Open the given job.
- `Ejs [arg]` - Open the given JavaScript file. With no argument provided, opens `resources/js/app.js`.
- `Elang <arg>` - Open the given language file.
- `Elistener [arg]` - Open the given listener.
    - In an event, call `:Elistener` without arguments to open the corresponding listener.
- `Elivewire <arg>` - Open the given Livewire component.
- `Email <arg>` - Open the given mail.
- `Emiddleware <arg>` - Open the given middleware.
- `Emigration <arg>` - Open the given DB migration.
- `Emodel [arg]` - Open the given model.
    - Call `:Emodel` without arguments from inside a Factory, seeder, policy,
      or Unit test to open the model for the current file.
- `Enotification <arg>` - Open the given notification.
- `Enpm <arg>` - Open NPM `package.json` file.
    - Call `:Make` while editing `package.json` to run `npm install` via Dispatch.
- `Enpmlock <arg>` - Open NPM `package-lock.json` file.
    - Call `:Make` while editing `package-lock.json` to run `npm install` via Dispatch.
- `Eobserver <arg>` - Open the given observer.
- `Epolicy <arg>` - Open the given policy.
- `Eprovider [arg]` - Open the given provider. With no argument provided, opens `app/Providers/AppServiceProvider.php`.
- `Erepository <arg>` - Open the given repository.
- `Erequests <arg>` - Open the given request.
- `Eresource <arg>` - Open the given resource.
- `Eroute [arg]` - Open the given route file. With no argument provided, opens `routes/web.php`.
- `Erule <arg>` - Open the given rule.
- `Escope <arg>` - Open the given scope.
- `Escript <arg>` - Open the given script.
- `Eseeder [arg]` - Open the given seeder. With no argument provided, opens `database/seeders/DatabaseSeeder.php`.
- `Eservice <arg>` - Open the given service.
- `Etailwindconfig` - Open the Tailwind CSS configuration file.
- `Etest <arg>` - Open the given test.
    - Call `:Dispatch` while editing a test file to run the test with Pest via Dispatch.
- `Etrait <arg>` - Open the given trait.
- `Eview <arg>` - Open the given view.
- `Eviteconfig` - Open the Vite configuration file.
- `Eworkflow [arg]` - Open the given GitHub workflow. With no argument provided, opens `.github/workflows/ci.yml`.
