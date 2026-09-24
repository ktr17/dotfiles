# Anki英語フレーズカード フォーマットルール

英語学習用のフレーズをAnkiカードとして作成する際は、以下のルールに従う。

## デッキ運用方針

- デッキは1つにまとめる(例:「英語フレーズ」)。用途別にデッキを分けない。
- 用途の区別は **Tags** で行う(例:`email`, `conversation`)。
- 後で特定用途だけ復習したい場合は、タグで絞り込んだ「絞り込みデッキ(Filtered Deck)」を一時的に作成する。

## CSVフォーマット

列構成は以下の4列。

| 列名 | 内容 |
|---|---|
| Front | カード表面。**どんな場面・状況で使うか**を日本語で書く(直訳ではなく状況描写)。 |
| Back | カード裏面。対応する英語フレーズ。 |
| Tags | 分類用のラベル。スペース区切りで複数可(例:`email booking`)。 |
| Notes | 補足。誤答例、ニュアンスの違い、文法的な注意点など。 |

### CSVサンプル行

```csv
Front,Back,Tags,Notes
"相手の発言を理解したことを、confirmを重複させずに伝えたいとき","I understand that you have already confirmed [this] with them.","email understanding","✕ Thank you for confirming that you have already confirmed。(confirmの重複はNG)"
```

## 日本語訳(直訳)の列は作らない

- Frontの「場面描写」自体が意味のヒントとして機能するため、直訳を別列に足すと情報が重複する。
- 日本語→英語の変換回路ではなく、「場面→英語表現」を直接結びつける力を鍛えることを優先する。
- 例外:英文だけでは意味が取りにくい複雑な文のみ、Notes欄に簡単な補足を添える。

## Backの中の置き換え箇所

- Backの中で、状況に応じて変わる部分(日付・固有名詞・具体的な手段など)は、**抽象記号(X, Y など)ではなく具体的な英語のまま `[ ]` で囲んで示す**。
- 例:`I've booked an appointment with [them] for [October 1st].`
- 例:`I checked with [their online chat], and they said [we'd need to confirm this in person].`
- Frontの情報だけから再現可能な、固有情報を含まない汎用フレーズには `[ ]` を付けない。その場合はNotesに「固有情報なし、そのまま使える定型句」と明記する。

## カード作成時のチェックポイント

1. Frontだけを見て、Backの `[ ]` 以外の部分が再現できるか確認する。
2. 固有名詞・日付など、Frontから推測できない情報は `[ ]` で囲む。
3. 実際に自分が書いた誤答がある場合は、Notesに「✕ 誤答例 → 理由」の形で残す。
4. 1カード1フレーズを原則とし、複数の用法を1枚に詰め込まない。
