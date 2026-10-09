<div align="center">
  <h1>Mole</h1>
  <p><b>Macのディープクリーン、アプリアンインストール、システム最適化、ディスク分析、ステータス監視、軽量なオープンソースCLIとネイティブMacアプリ</b></p>
  <p><a href="README.md">English</a> · <a href="README_CN.md">中文</a> · <a href="README_TW.md">繁體</a> · 日本語 · <a href="README_KR.md">한국어</a> · <a href="README_DE.md">Deutsch</a> · <a href="README_FR.md">Français</a></p>
  <a href="https://github.com/tw93/mole/stargazers"><img src="https://img.shields.io/github/stars/tw93/mole?style=flat-square" alt="Stars"></a>
  <a href="https://github.com/tw93/mole/releases"><img src="https://img.shields.io/github/v/tag/tw93/mole?label=version&style=flat-square" alt="Version"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL_v3-blue.svg?style=flat-square" alt="License"></a>
  <a href="https://github.com/tw93/mole/commits"><img src="https://img.shields.io/github/commit-activity/m/tw93/mole?style=flat-square" alt="Commits"></a>
  <a href="https://twitter.com/HiTw93"><img src="https://img.shields.io/badge/follow-Tw93-red?style=flat-square&logo=Twitter" alt="Twitter"></a>
  <a href="https://t.me/+9f9gf4ZrFSQ2OWVl"><img src="https://img.shields.io/badge/chat-Telegram-blueviolet?style=flat-square&logo=Telegram" alt="Telegram"></a>
</div>

<p align="center">
  <img src="./docs/img/big-mole.png" alt="Mole クリーンアップ結果" width="1000" />
</p>

> 💡 グラフィカルな画面をお好みですか？ネイティブデスクトップアプリ [Mole for Mac](https://mole.fit/) をお試しください。削除前の項目別確認、システムデータの深層クリーン、AIツールのメンテナンスとクリーン、800種以上のアプリのアンインストール残留データ対策、ワンタップでのシステム最適化、多階層のディスク空間分析を提供します。システムステータス監視、ファン制御、スリープ防止機能も備えています。

## 機能

- **オールインワンCLIツール**：CleanMyMac、AppCleaner、DaisyDisk、iStat Menusの主要機能を高速な単一バイナリに集約
- **ディープクリーン**：キャッシュ、ログ、一時ファイル、アンインストール残留物を安全に削除して空き容量を確保
- **スマートアンインストーラ**：アプリ本体とLaunchAgents、設定ファイル、関連残留物をまとめて完全削除
- **ディスク分析**：インタラクティブTUIで容量内訳を可視化し、大容量ファイルを探索
- **システム最適化**：DNSキャッシュのフラッシュ、QuickLook・アイコンキャッシュの再構築、システムデータベースの最適化
- **リアルタイム監視**：CPU、メモリ、ディスクI/O、ネットワーク通信量、プロセス状態をターミナルで確認

## クイックスタート

MoleはmacOS 12以降に対応し、IntelおよびApple Silicon Macの双方をサポートします。

**Homebrewでインストール**

```bash
brew install mole
```

お使いのmacOS環境でHomebrewが利用できない場合は、以下のスクリプトをご利用ください。

**スクリプトでインストール**

```bash
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash
```

MoleはmacOS向けに設計されています。実験的なWindows版は [windowsブランチ](https://github.com/tw93/Mole/tree/windows) をご覧ください。

**主要コマンド**

```bash
mo                           # インタラクティブメニューを開く
mo clean                     # ディープクリーン：システムキャッシュ、ログ、削除済みアプリの残留ファイル削除
mo uninstall                 # アプリ削除：インストール済みアプリと関連設定ファイルの完全アンインストール
mo optimize                  # システム最適化：システムサービスとキャッシュのリフレッシュ
mo analyze                   # ディスク分析：ディスク容量の内訳確認と大容量ファイルの探索
mo status                    # 状態監視：CPU、メモリ、ネットワーク、ハードウェアの健康度ダッシュボード
mo purge                     # プロジェクトクリーン：ビルド生成物（node_modules、targetなど）の整理
mo installer                 # インストーラ整理：使用済みDMGおよびPKGファイルの探索と削除

mo touchid                   # ターミナルsudo用Touch ID認証の設定
mo completion                # シェル補完の設定
mo update                    # Moleの更新を確認・実行
mo update --nightly          # 未リリースの最新開発版に更新（スクリプトインストール環境のみ）
mo remove                    # システムからMoleを完全削除
mo --help                    # ヘルプを表示
mo --version                 # インストール済みバージョンを表示
```

**安全プレビュー（Dry Run）**

```bash
mo clean --dry-run
mo uninstall --dry-run
mo optimize --dry-run
mo purge --dry-run
mo installer --dry-run
mo history
mo history --json

mo clean --dry-run --debug   # 安全プレビュー + 詳細ログ
mo optimize --whitelist      # 保護する最適化ルールの管理
mo clean --whitelist         # 保護するキャッシュホワイトリストの管理
mo purge --paths             # プロジェクト検索ディレクトリの設定
mo analyze /Volumes          # 外付けドライブのみ分析
mo analyze /private/tmp      # 一時ディレクトリの確認（自動削除なし）
```

`mo clean --whitelist` で保存したパスは `~/.config/mole/whitelist` に保持されます（1行に1パス直接編集も可能）。独自設定は標準ルールを補完し、組み込みのシステム保護は常に有効です。

<details>
<summary><strong>その他のインストールオプション</strong></summary>

特定バージョンをインストールする場合は、[Releasesページ](https://github.com/tw93/mole/releases) のタグを指定してください。開発ブランチを利用する場合は `main` を指定します：

```bash
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash -s -- 1.51.0
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash -s -- main
```

スクリプトは通常 `/usr/local/bin` にインストールされ、管理者パスワードが求められる場合があります。パスワード入力なしで `mo update` を実行したい場合は、ユーザーディレクトリにインストールしてください：

```bash
mkdir -p "$HOME/.local/bin"
curl -fsSL https://raw.githubusercontent.com/tw93/mole/main/install.sh | bash -s -- --prefix "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
```

**Nix**

macOS環境のNixユーザーは、`main` ブランチからflakeを直接インストールできます：

```bash
nix profile install github:tw93/mole/main#mole
nix profile upgrade mole
nix profile remove mole
```

</details>

PAPAYA 電腦教室 による [Moleチュートリアル動画](https://www.youtube.com/watch?v=UEe9-w4CcQ0) をご覧いただけます。

## 安全性

Moleはデータ保護を最優先に設計されています。パスの妥当性を厳格に検証し、システム重要ディレクトリや保護対象データを除外し、削除操作の前に確認を求めます。安全性が確認できないファイルは自動的にスキップされます。

- `clean`、`uninstall`、`purge`、`installer`、`remove` はファイル削除を伴います。事前に `--dry-run` で確認し、必要に応じて `--debug` を併用してください
- 通常利用では **`sudo` 不要** です。システム領域のクリーン時のみ必要に応じて管理者権限を要求します
- `mo analyze` による削除は確認後にmacOSのゴミ箱へ移動されるため、いつでも復元可能です
- クリーンアップ履歴は `~/Library/Logs/mole/operations.log` に記録されます。`mo history` で確認するか、`MO_NO_OPLOG=1` で無効化できます
- `mo clean --whitelist` で保持したいキャッシュを保護し、`mo optimize --whitelist` で除外項目を設定できます

詳細は [SECURITY.md](SECURITY.md) および [SECURITY_AUDIT.md](SECURITY_AUDIT.md) をご覧ください。

## 機能詳細

以下の表示例は抜粋です。実際の表示項目や容量はご利用のMac環境によって異なります。

### ディープクリーン（Clean）

`mo clean` は安全なキャッシュ、ログ、一時ファイル、開発ツールキャッシュ、アンインストール済みアプリの残留物を探索して削除します。`mo clean --dry-run` で事前確認し、`mo clean --whitelist` で特定ディレクトリを保護できます。

```text
$ mo clean

Clean Your Mac

⚙ Apple Silicon | Free space: 219.0GB

➤ User essentials
  ✓ User app cache · 18 items, 2.4GB
  ✓ User app logs · 7 items, 12.8MB
  ✓ Trash · emptied, 9 items

➤ App caches
  ✓ App Store cache · 8 items, 248.5MB

➤ Browsers
  ✓ Safari cache · 24 items, 642.1MB
  ✓ Chrome cache · 31 items, 1.2GB

➤ Developer tools
  ✓ npm cache · cleaned
  ◎ pnpm cache · skipped (pnpm busy)

======================================================================
Cleanup complete
Tracked cleanup: 4.5GB | Items cleaned: 97 | Categories: 4
Free space: 223.5GB (+4.5GB)
======================================================================
```

### アプリアンインストール（Uninstall）

`mo uninstall` はインストール済みアプリと、関連する設定ファイル、キャッシュ、自動起動項目を完全に削除します。他のアプリと共有されているデータは安全に保持されます。

```text
$ mo uninstall

Select Apps to Remove  1/3 selected

➤ ● Photoshop 2024                4.20GB | 2mo ago
  ○ IntelliJ IDEA                 2.80GB | 3d ago
  ○ Premiere Pro                  3.40GB | 2w ago

Files to be removed:

✓ Photoshop 2024, 12.80GB
  ✓ /Applications/Adobe Photoshop 2024/Adobe Photoshop 2024.app
  ✓ ~/Library/Application Support/Adobe/Adobe Photoshop 2024
  ✓ ~/Library/Preferences/com.adobe.Photoshop.plist

======================================================================
Uninstall complete
Removed 1 app, freed 12.80GB: Photoshop 2024
======================================================================
```

### システム最適化（Optimize）

`mo optimize` はFinder、ネットワーク、システムデータベース、macOSサービスを安全にメンテナンスします。不要な処理、使用中、または利用できない項目は理由とともに自動スキップされます。

```text
$ mo optimize

Optimize

⚙ System  18/32 GB RAM | 616/926 GB Disk | Uptime 6d

PERFORMANCE DIAGNOSIS
  ✓ No sustained high-CPU bottleneck detected

➤ DNS & Spotlight Check
  → DNS cache flushed
  → Spotlight index verified

➤ Finder Cache Refresh
  → QuickLook thumbnails refreshed
  → Icon services cache rebuilt

➤ Database Optimization
  ◎ Close these apps before database optimization: Safari

➤ Disk Health
  → Disk verify skipped (set MOLE_ENABLE_DISK_VERIFY=1 to enable)

======================================================================
Optimization Complete
Applied 3 optimizations
14 unchanged | 3 skipped | 1 unavailable
======================================================================
```

### ディスク分析（Analyze）

`mo analyze` はターミナル内で動作するインタラクティブなディスク探索ツールです。矢印キーやVimキーバインドでの移動、絞り込み、複数選択、Finderプレビュー、ゴミ箱への移動に対応しています。外付けドライブは通常画面から除外されており、`mo analyze /Volumes` で確認できます。

```text
$ mo analyze

Analyze Disk  (302.1GB free)
Select a location to explore:

 ▶  1. ████████████████████████  47.9%  |  Home                       75.4GB
     2. ███████████               22.0%  |  User Library               34.6GB
     3. ███████                   14.2%  |  Applications               22.4GB
     4. █████                     10.7%  |  System Library             16.9GB
     5. ███                        5.2%  |  Old Downloads (90d+)       8.2GB  >3mo
```

### 状態監視（Status）

`mo status` はハードウェア、システム負荷、ディスクI/O、ネットワーク通信量、バッテリー状態を一覧表示する読み取り専用ダッシュボードです。

```text
$ mo status

Mole Status  Health ● 92  MacBook Pro · M4 Pro · 32GB · macOS 26

⚙ CPU                                    ▦ Memory
Total   ████████████░░░░░░░  45.2%       Used    ███████████░░░░░░░  58.4%
Load    0.82 / 1.05 / 1.23 (8 cores)     Total   18.7 / 32.0 GB
Core 1  ███████████████░░░░  78.3%       Free    ████████░░░░░░░░░░  41.6%
Core 2  ████████████░░░░░░░  62.1%       Avail   13.3 GB

▤ Disk                                   ⚡ Power
Used    █████████████░░░░░░  67.2%       Level   ██████████████████  100%
Free    156.3 GB                         Status  Charged
Read    ▮▯▯▯▯  2.1 MB/s                  Health  Normal · 423 cycles
Write   ▮▮▮▯▯  18.3 MB/s                 Temp    58°C · 1200 RPM

⇅ Network                                ▶ Processes
Down    ▁▁█▂▁▁▁▁▁▁▁▁▇▆▅▂  0.54 MB/s      Zombies 3 · Chrome (4242) ×3
Up      ▄▄▄▃▃▃▄▆▆▇█▁▁▁▁▁  0.02 MB/s      Code       ▮▮▮▮▯  42.1%
Proxy   HTTP · 192.168.1.100             Chrome     ▮▮▮▯▯  28.3%
```

<details>
<summary><strong>JSON、NDJSON出力</strong></summary>

- `mo analyze --json ~/Documents`：指定パスのディスク分析結果をJSONで出力
- `mo status --json`：システムステータスをJSONで出力
- `mo status | jq '.health_score'`：パイプ接続時に自動でJSONモードへ切り替え
- `mo status --watch --interval 2s`：NDJSON形式でリアルタイムストリーミング
- `mo history --json`：クリーンアップ履歴をJSONで出力

</details>

### プロジェクトクリーン（Purge）

`mo purge` は再ビルド可能なプロジェクト生成ディレクトリ（`node_modules`、`target`、`.build`、`build`、`dist` など）を検出します。プロジェクトごとに整理して表示し、チェックして確認した項目のみを削除します。直近7日間に変更のあった項目は標準で選択解除されます。

<details>
<summary><strong>Purge 出力例</strong></summary>

```text
$ mo purge

Purge Project Artifacts

Select Artifacts to Purge
6.00GB, 2 selected

➤ ● ┌ ~/Projects/website        3.80GB | node_modules | 28d
  ○ └ ~/Projects/website         186MB | dist         | <1d
  ● ┌ ~/Projects/rust-app       2.20GB | target       | 2mo
  ○ └ ~/Projects/rust-app         22MB | dist         | <7d

======================================================================
Purge complete
Estimated space freed: 6.00GB | Items: 2 | Free: 223.5GB
======================================================================
```

</details>

### インストーラ整理（Installer）

`mo installer` はダウンロード、デスクトップ、Homebrewキャッシュ、iCloud、Mail、TelegramなどからDMG、PKG、MPKG、ISO、XIP、ZIPインストーラを探索します。削除前にサイズと保存場所が表示されます。

<details>
<summary><strong>Installer 出力例</strong></summary>

```text
$ mo installer

Select Installers to Remove, 3.83GB, 5 selected

➤ ● Photoshop_2024.dmg          1.20GB | Downloads
  ● IntelliJ_IDEA.dmg          850.6MB | Downloads
  ● Illustrator_Setup.pkg      920.4MB | Downloads
  ● PyCharm_Pro.dmg            640.5MB | Homebrew
  ● Acrobat_Reader.dmg         220.4MB | Downloads
  ○ AppCode_Legacy.zip         410.6MB | Downloads

======================================================================
Installers cleaned
Removed 5 installers, freed 3.83GB
======================================================================
```

</details>

## クイックランチャー

<details>
<summary><strong>Raycast & Alfred設定</strong></summary>

Clean、Uninstall、Optimize、Analyze、Status の5つのランチャーを一括設定：

```bash
curl -fsSL https://raw.githubusercontent.com/tw93/Mole/main/scripts/setup-quick-launchers.sh | bash
```

RaycastコマンドおよびAlfredワークフローが自動追加されます。

</details>

## コミュニティ

Moleの開発に貢献いただいたすべての方に感謝申し上げます ❤️

<a href="https://github.com/tw93/Mole/graphs/contributors">
  <img src="./CONTRIBUTORS.svg?v=2" alt="Mole コントリビューター" width="1000" />
</a>

<br/><br/>
X (Twitter) で寄せられた実際の声：

<img src="./docs/img/mole-love.png" alt="コミュニティフィードバック" width="1000" />

## サポート

- [Mole for Mac](https://mole.fit) の購入が、Moleの継続開発を支援する最も直接的な方法です
- Moleが役に立った場合は、GitHubのStarや [Xでのシェア](https://twitter.com/intent/tweet?url=https://github.com/tw93/Mole&text=Mole%20-%20Deep%20clean%20and%20optimize%20your%20Mac.)、Issue・PRでのフィードバックをお願いします
- 飼い猫の「湯圓（タンユエン）」と「コーラ」に <a href="https://cats.tw93.fun?name=Mole" target="_blank">缶詰 🥩</a> をプレゼントしていただけると励みになります

<details>
<summary>支援してくださった方々 🐱</summary>
<br/>
<a href="https://cats.tw93.fun?name=Mole"><img src="https://cdn.jsdelivr.net/gh/tw93/sponsors@main/assets/sponsors.svg" alt="スポンサー" width="1000" loading="lazy" /></a>
</details>

## ライセンス

MoleはGPL-3.0ライセンスのもとでオープンソース公開されています。詳細は [LICENSE](LICENSE) をご覧ください。

[Mole for Mac](https://mole.fit) は個別のネイティブデスクトップアプリです。
