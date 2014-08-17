# Demonet

## Preparación

1.  Instalar [`rbenv`](https://github.com/sstephenson/rbenv)
    y [`ruby-build`](https://github.com/sstephenson/ruby-build)
    como plugin de este

    ```bash
    sudo apt-get install rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    ```

    Nota: `~/.bash.profile` es `~/.bashrc` en Ubuntu.

2.  Instalar el patch más reciente de ruby 2.0 (p451) y
    rails (4.1.4)

    ```bash
    rbenv install 2.0.0-p451
    # Seleccionarlo como global
    rbenv global ruby2.0.0-p451
    gem install rails
    ```

3.  Bajar el código y preparar el bundle

    ```bash
    git clone git@github.com:RevolucionDemocraticaChile/demonet.git
    cd demonet
    bundle install
    bundle exec rake db:migrate
    bundle exec rake test:prepare
    ```

4.  Iniciar el servidor y probar

    ```bash
    rails server
    ```
