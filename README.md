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
    Nota: una de las _gems_ del `Gemfile` es `rb-readline`, que puede que
    dependa de `libreadline`. Si tu sistema no incluye `libreadline`, tendrás
    que instalarla a mano. En Ubuntu, puedes hacerlo con

    ```bash
    sudo apt-get install libreadline-dev
    ```

4.  Crear el usuario inicial

    A través de la consola de ruby, accesible con `rails console`:

    ```ruby
    user  = User.new(
      username: "admin",
      name: "Fulano de Tal",
      email: "mi@correo.com",
      password: "miclave",
      password_confirmation: "miclave",
      admin: true
    )
    if user.valid?
      user.save
    else
      user.errors.full_messages
    end
    ```

5.  Iniciar el servidor y probar

    ```bash
    rails server
    ```
