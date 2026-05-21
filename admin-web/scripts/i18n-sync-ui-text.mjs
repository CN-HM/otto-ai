import { readFileSync, readdirSync, writeFileSync, statSync } from 'node:fs';
import { join, relative } from 'node:path';

const root = process.cwd();
const appRoot = join(root, 'src', 'app');
const zhHansPath = join(root, 'src', 'assets', 'locales', 'zh-Hans.json');
const zhTwPath = join(root, 'src', 'assets', 'locales', 'zh-TW.json');
const excluded = ['src\\app\\api', 'src/app/api', 'src\\app\\core\\i18n\\chinese-script-localizer.ts', 'src/app/core/i18n/chinese-script-localizer.ts'];
const translatedAttributes = ['label', 'placeholder', 'header', 'text', 'formTitle', 'asideTitle', 'title', 'alt', 'aria-label', 'description'];

const phraseMap = new Map([
  ['智能体', '智能體'], ['知识库', '知識庫'], ['记忆库', '記憶庫'], ['运行时', '執行時'], ['用户管理', '用戶管理'], ['设备管理', '設備管理'], ['系统管理', '系統管理'], ['订单管理', '訂單管理'], ['待办事项', '待辦事項'], ['工具插件', '工具外掛'], ['语音识别', '語音辨識'], ['语音合成', '語音合成'], ['图形验证码', '圖形驗證碼'], ['短信验证码', '簡訊驗證碼'], ['手机号', '手機號'], ['用户名', '使用者名稱'], ['客户端', '用戶端'], ['服务端', '服務端'], ['云平台', '雲平台'], ['云端', '雲端'], ['文件', '檔案'], ['文档', '文件'], ['暂无', '暫無'], ['当前', '目前'], ['启用', '啟用'], ['默认', '預設'], ['普通', '一般'], ['编辑', '編輯'], ['删除', '刪除'], ['确认', '確認'], ['保存', '儲存'], ['刷新', '重新整理'], ['加载', '載入'], ['请求', '請求'], ['失败', '失敗'], ['状态', '狀態'], ['类型', '類型'], ['详情', '詳情'], ['配置', '設定'], ['设置', '設定'], ['筛选', '篩選'], ['查询', '查詢'], ['搜索', '搜尋'], ['关键词', '關鍵字'], ['更新时间', '更新時間'], ['创建时间', '建立時間'], ['名称', '名稱'], ['编码', '編碼'], ['说明', '說明'], ['金额', '金額'], ['额度', '額度'], ['支付', '付款'], ['渠道', '通路'], ['凭证', '憑證'], ['绑定', '綁定'], ['解绑', '解除綁定'], ['对话', '對話'], ['链路', '鏈路'], ['阶段', '階段'], ['检索', '檢索'], ['上传', '上傳'], ['导入', '匯入'], ['规则', '規則'], ['记录', '記錄'], ['内容', '內容'], ['音频', '音訊'], ['声纹', '聲紋'], ['开场', '開場'], ['结束', '結束'], ['开关', '開關'], ['日志', '日誌'], ['审计', '稽核'], ['权限', '權限'], ['菜单', '選單'], ['页面', '頁面']
]);

const charMap = new Map([
  ['欢', '歡'], ['载', '載'], ['户', '戶'], ['账', '帳'], ['号', '號'], ['码', '碼'], ['验', '驗'], ['证', '證'], ['发', '發'], ['读', '讀'], ['写', '寫'], ['库', '庫'], ['数', '數'], ['据', '據'], ['权', '權'], ['问', '問'], ['页', '頁'], ['总', '總'], ['条', '條'], ['当', '當'], ['显', '顯'], ['详', '詳'], ['览', '覽'], ['说', '說'], ['错', '錯'], ['误', '誤'], ['请', '請'], ['试', '試'], ['筛', '篩'], ['选', '選'], ['询', '詢'], ['确', '確'], ['认', '認'], ['统', '統'], ['设', '設'], ['备', '備'], ['语', '語'], ['识', '識'], ['别', '別'], ['动', '動'], ['检', '檢'], ['测', '測'], ['绑', '綁'], ['编', '編'], ['辑', '輯'], ['删', '刪'], ['启', '啟'], ['择', '擇'], ['对', '對'], ['应', '應'], ['参', '參'], ['云', '雲'], ['关', '關'], ['键', '鍵'], ['词', '詞'], ['运', '運'], ['现', '現'], ['没', '沒'], ['败', '敗'], ['忆', '憶'], ['规', '規'], ['则', '則'], ['义', '義'], ['记', '記'], ['录', '錄'], ['与', '與'], ['级', '級'], ['审', '審'], ['计', '計'], ['结', '結'], ['实', '實'], ['体', '體'], ['变', '變'], ['细', '細'], ['异', '異'], ['资', '資'], ['浏', '瀏'], ['释', '釋'], ['项', '項'], ['类', '類'], ['定', '訂'], ['线', '線'], ['扩', '擴'], ['访', '訪'], ['册', '冊'], ['后', '後'], ['开', '開'], ['诉', '訴'], ['档', '檔'], ['态', '態'], ['撑', '撐'], ['迁', '遷'], ['签', '簽'], ['约', '約'], ['单', '單'], ['额', '額'], ['创', '創'], ['处', '處'], ['严', '嚴'], ['险', '險'], ['务', '務'], ['会', '會'], ['缓', '緩'], ['冲', '衝'], ['输', '輸'], ['频', '頻'], ['链', '鏈'], ['阶', '階'], ['图', '圖'], ['树', '樹'], ['续', '續'], ['触', '觸'], ['联', '聯'], ['调', '調'], ['拟', '擬'], ['仪', '儀'], ['盘', '盤'], ['节', '節'], ['点', '點'], ['绪', '緒'], ['桥', '橋'], ['稳', '穩'], ['场', '場'], ['势', '勢'], ['韧', '韌'], ['盖', '蓋'], ['阈', '閾'], ['转', '轉'], ['历', '歷'], ['产', '產'], ['优', '優'], ['质', '質'], ['专', '專'], ['获', '獲'], ['寻', '尋'], ['离', '離'], ['闭', '閉'], ['仅', '僅'], ['递', '遞'], ['归', '歸'], ['临', '臨'], ['满', '滿'], ['换', '換'], ['组', '組'], ['导', '導'], ['航', '航'], ['称', '稱'], ['帮', '幫'], ['标', '標'], ['题', '題'], ['复', '複'], ['夹', '夾'], ['队', '隊'], ['积', '積'], ['压', '壓'], ['宽', '寬'], ['围', '圍'], ['构', '構'], ['须', '須'], ['凭', '憑'], ['长', '長'], ['网', '網'], ['领', '領']
]);

function listFiles(dir) {
  return readdirSync(dir).flatMap(name => {
    const path = join(dir, name);
    const rel = relative(root, path);
    if (excluded.some(item => rel.startsWith(item))) {
      return [];
    }
    const stat = statSync(path);
    if (stat.isDirectory()) {
      return listFiles(path);
    }
    return /\.(html|ts)$/.test(path) ? [path] : [];
  });
}

function normalizeText(value) {
  return value.replace(/\s+/g, ' ').trim();
}

function shouldKeep(value) {
  return /[\u4e00-\u9fff]/.test(value)
    && value.length > 0
    && value.length <= 180
    && !/[<>;]/.test(value)
    && !/[{}]|=>|\b(const|let|return|readonly|Observable|Record|Partial|signal|subscribe|function|export|import)\b|this\./.test(value)
    && !value.includes('{{')
    && !value.includes('@if')
    && !value.includes('@for');
}

function toTraditional(value) {
  let result = value;
  for (const [source, target] of phraseMap) {
    result = result.split(source).join(target);
  }
  return Array.from(result).map(char => charMap.get(char) ?? char).join('');
}

function collectFromFile(path, texts) {
  const content = readFileSync(path, 'utf8');
  for (const attr of translatedAttributes) {
    const regex = new RegExp(`\\b${attr}="([^"]*[\\u4e00-\\u9fff][^"]*)"`, 'g');
    for (const match of content.matchAll(regex)) {
      const value = normalizeText(match[1]);
      if (shouldKeep(value)) texts.add(value);
    }
  }

  for (const match of content.matchAll(/>([^<>]*[\u4e00-\u9fff][^<>]*)</g)) {
    const value = normalizeText(match[1]);
    if (shouldKeep(value)) texts.add(value);
  }

  for (const match of content.matchAll(/(['"`])([^'"`\r\n]*[\u4e00-\u9fff][^'"`\r\n]*)\1/g)) {
    const value = normalizeText(match[2]);
    if (shouldKeep(value)) texts.add(value);
  }
}

const texts = new Set();
for (const file of listFiles(appRoot)) {
  collectFromFile(file, texts);
}

const sortedTexts = [...texts].sort((a, b) => a.localeCompare(b, 'zh-Hans'));
const zhHans = JSON.parse(readFileSync(zhHansPath, 'utf8'));
const zhTw = JSON.parse(readFileSync(zhTwPath, 'utf8'));
zhHans.uiText = zhHans.uiText ?? {};
zhTw.uiText = zhTw.uiText ?? {};

for (const text of sortedTexts) {
  zhHans.uiText[text] = zhHans.uiText[text] ?? text;
  zhTw.uiText[text] = zhTw.uiText[text] ?? toTraditional(text);
}

for (const key of Object.keys(zhHans.uiText)) {
  if (!texts.has(key)) delete zhHans.uiText[key];
}
for (const key of Object.keys(zhTw.uiText)) {
  if (!texts.has(key)) delete zhTw.uiText[key];
}

writeFileSync(zhHansPath, `${JSON.stringify(zhHans, null, 2)}\n`, 'utf8');
writeFileSync(zhTwPath, `${JSON.stringify(zhTw, null, 2)}\n`, 'utf8');
console.log(`Synced ${sortedTexts.length} UI text entries.`);
