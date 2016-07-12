# My Mac Setup

This repo contains a set of instructions and scripts that I use to set up my environment for work and play.

## Step 1: Download App Store Apps

I haven't yet found a way to automate downloading App Store apps, so the first step in this process is to run App Store.app and install the necessary apps. In my case, this is:

* [1Password](https://agilebits.com/onepassword)
* [Beautiful Earth](https://beautifulearth.io/)
* [Boxy](http://www.boxyapp.co/)
* [Clear](http://realmacsoftware.com/clear/)
* [Icon Slate](http://www.kodlian.com/apps/icon-slate)
* [Tweetbot](http://tapbots.com/tweetbot/mac/)
* [Xcode](https://developer.apple.com/xcode/)

The most important app to install here is **Xcode**, this needs to be installed in order to proceed with the full environment setup.

*Note: If you want to figure out which apps you've installed via the App Store, you can enter the following command:*

```
find /Applications \
-path '*Contents/_MASReceipt/receipt' \
-maxdepth 4 -print |\
sed 's#.app/Contents/_MASReceipt/receipt#.app#g; s#/Applications/##'
```

## Step 2: Download this repo

At this stage, Github access hasn't been set up on the system, so  grab this repo using ```curl``` so its scripts can be run. *(We'll checkout the repo to it's permanent location later).*

Open Terminal and enter:

```
cd ~
curl -O https://github.com/ursooperduper/mac-setup/archive/master.zip
```

Then enter ```unzip``` to extract the zip file to your home directory with the folder name, ```mac-setup-master```.


## Step 3: Java Stuff

Unfortunately, some tools require Java. So you need to download and install the following:

* [Java for OS X](http://java.com/en/download/mac_download.jsp)
* [Java SE Runtime Environment](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html)

## Step 4: Customize MacOS

The ```.macos``` script customizes the OS so it runs the way I like it.  It's based on the awesome work found here: https://github.com/mathiasbynens/dotfiles/blob/master/.macos

In Terminal, enter:

```
cd ~/mac-setup-master
. scripts/.macos
```

## Step 5: Run mac-setup.sh

Navigate to the ```mac-setup-master``` directory and run the mac-setup script.

```
cd ~/mac-setup-master
. scripts/mac-setup.sh
```

The mac-setup script does the following:

* Checks to see if Xcode is installed (and exits if it's not installed)
* Checks for (and installs Command Line Tools)
* Agrees to the Xcode ToS
* Creates an SSH key (& copies it to the clipboard) and prompts you to add it to Github
* Creates working directories (~/code/personal, ~/code/work, & ~/code/third-party)
* Clones Github repos (ursooperduper.github.io, keys, .atom, dotfiles, cheatsheets, prototypes, mac-setup)
* Runs ```npm install``` and ```bundle install``` for projects
* Exports .keys so they're available as environment variables
* Symlinks relevant .keys and .dotfiles files (ex: .gitconfig, .bashrc)
* Runs OS X Customization script (based on ...)
* Installs Homebrew and Cask (versions, apps, fonts)
* Installs Homebrew binaries, Cask binaries, Cask fonts, and Ruby Gems

*Note:It may be necessary to run the script more than once for machine restarts and installations. I'll improve the script over time to address that flow.*

## Step 6: Set up Dropbox

Run the [Dropbox](http://dropbox.com) app, log in for the first time, and then customize which directories are synced to the machine. The most important directories to include in the selective sync are:

* 1Password.agilekeychain
* alfred
* Dash
* Fonts

## Step 7: Copy fonts to ~/fonts folder

Where possible, fonts are installed using Homebrew.  The rest of my fonts are saved to Dropbox (and are now synced to this machine - thanks, Step 4!).

There may be a better way to do this, but next, I copy my fonts from ~/Dropbox/Fonts to the ~/fonts folder.

## Step 8: Set up 1Password

Open 1Password and go through its setup. In the process, be sure to point the archive at the ~/Dropbox/1Password.agilekeychain folder.

**Keep 1Password open for now as you'll need it throughout your machine setup.**

## Step 9: Set up Alfred

### Add Powerpack License

Alfred is super cool when you add the [Powerpack](https://www.alfredapp.com/powerpack/), so grab its license which is saved in 1Password.

### Sync Alfred Config Files

Go the Advanced tab in Alfred's preference window and at the bottom right, click the ```Set Sync Folder``` button and point that at: ```~/Dropbox/alfred```

These files include Alfred preferences, extensions, custom sites, etc. There are a few things that aren't set so you can modify them from machine to machine. See Alfred's documentation for more.

### Enable 1Password Integration

Finally, go to the Features tab in the Preferences dialog and enable 1Password integration.

## Step 10: Set up Browsers

Install Browser Extensions for Chrome, Firefox, and Safari
* 1Password
* Evernote Web Clipper
* Ghostery

I also like to use Booky.io to store my bookmarks (I think, I'm still experimenting with this.) You can drag a bookmark shortcut from the site to the browser.

Set up work profiles as necessary (I like to do this in Chrome to keep work and personal email separate).

## Step 11: Log into Adobe Creative Cloud & Set Up

Run Adobe Creative Cloud and set it to run on startup.

After a successful set up, install:
* Photoshop
* Illustrator

## Step 12: Set up Startup Apps

Next, run and set up all the apps that should start every time you log in.

* [Bartender 2](https://www.macbartender.com/)
* [Beautiful Earth](https://beautifulearth.io/)
* [Boom 2](http://www.globaldelight.com/boom/index.php)
* [Caffeine](http://lightheadsw.com/caffeine/)
* [Clean My Mac](http://macpaw.com/cleanmymac)
* [Dash](https://kapeli.com/dash)
* [Noizio](http://noiz.io/)
* [SizeUp](http://www.irradiatedsoftware.com/sizeup/)

## Step 13: Add Themes to iTerm 2

Run iTerm and then download the color schemes available [here](http://iterm2colorschemes.com). Follow the instructions on the site for installation.

## Step 14: Set up Screensaver

[Aerial](https://github.com/JohnCoates/Aerial)

## Step 15: Install Kindle & Download Reference Material

I like to keep reference material in ebook form, so it's very portable. After logging in to the Kindle, download programming and design references books from my Kindle account.

## Step 16: Add Licenses for Other Apps

* Framer Studio
* Omnigraffle
* Reflector
* Sketch
