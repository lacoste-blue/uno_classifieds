# UNO Classifieds

## Getting Started

The UNO Classifieds application runs on Ruby version `2.3.3`. Please note this before continuing.

### Running with Ruby

The basic steps will be:
1) Install Ruby
2) Install Bundler
3) Install gem dependencies
4) Run the application

#### Windows

##### Installing Ruby

To install ruby on Windows the recommended procedure is to use the ruby_installer which you can download [here](https://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.3.3-x64.exe).

After downloading, double click the exe in order to install ruby.

Next you must install the Development Kit which you can download [here](https://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe).

After downloading move the Development Kit into your home directory and double click to install it. Next open Powershell and run the following commands:

```powershell
cd $home
ruby dk.rb init
ruby dk.rb install
```

##### Installing bundler

```powershell
gem install bundler
```

Now navigate to this project's directory in Powershell.

##### Install gem dependencies

```powershell
bundle install
```

##### Run the application

```powershell
rails s
```

Navigate to `localhost:3000` in your favorite web browser!

Done!

#### Unix

##### Installing Ruby

To install Ruby on a Unix machine the recommended procedure is to use RVM.

Open a terminal an run the following commands:

```bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
# There will be some output about sourcing a file to make RVM work in the current shell copy, paste, and run the source command
rvm install ruby 2.3.3
```

##### Installing bundler

```bash
gem install bundler
```

Now navigate to this project's directory in your terminal.

##### Install gem dependencies

```bash
bundle install
```

##### Run the application

```bash
rails s
```

Navigate to `localhost:3000` in your favorite web browser!

Done!

### Running with Docker

For help installing Docker please refer to the [installation docs](https://docs.docker.com/engine/installation/#supported-platforms).

Navigate to this project's directory in either your terminal or Powershell.

```shell
docker build .
# The command above will output a container ID that you can run.
docker run -it -p 3000:3000 <THE ID FROM ABOVE>
```

Navigate to `localhost:3000` in your favorite web browser!

If this isn't working run `docker-machine env` to get the ip of the host machine and navigate to that IP at 3000.

Done!

## Running Tests

We use RSpec for our unit tests. Running your test couldn't be simplier!

### Running with Ruby:

```bash
bundle exec rspec
```
