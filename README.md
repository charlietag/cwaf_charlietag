# cwaf rules backup (Nginx with ModSecurity 3.0.x use)

* Git clone scripts

  ```bash
  git clone https://github.com/charlietag/cwaf_charlietag.git
  ```

* Setup `conf/cwaf_param.cfg`

  ```bash
  PARAM_COMODO_RULES_account="xxx@gmail.com"
  PARAM_COMODO_RULES_password="xxxxxxxxxxxxx"
  ```

* Start to download latest cwaf rules

  ```bash
  ./start.sh
  ```

* Latest downloaded version will record here
  * **cwaf_charlietag/installed_modules/waf_comodo_download.sh.dat**

    ```bash
    comodo-rules-version:x.xyz
    ```

* Downloaded tgz files will located here
  * **cwaf_charlietag/output/cwaf_rules_nginx_3-x.xyz.tgz**
