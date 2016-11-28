<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContractPet.aspx.cs" Inherits="ContractPet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

 p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        .auto-style2 {
            font-weight: bold;
        }
        .auto-style3 {
            color: #0000FF;
            font-weight: bold;
        }
        .auto-style4 {
            color: #000099;
            font-weight: bold;
        }
        .auto-style5 {
            color: #000099;
        }
        .auto-style6 {
            font-family: 微軟正黑體;
            font-size: medium;
        }
        .auto-style7 {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan; mso-outline-level: 3; background: #FEFEFE">
                    <span>定型化接待契約</span><span lang="EN-US"><o:p></o:p></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="MsoNormal">
                    <span>本契約為系統依範本自動產生</span><span lang="EN-US">,&nbsp;</span><span class="auto-style3">藍色字體</span><span>部份依家長與保姆設定填入</span><span lang="EN-US">, </span><span>預約前請詳閱。</span><span lang="EN-US"><o:p></o:p></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="MsoNormal">
                    <span>立約人</span><span lang="EN-US"><o:p></o:p></span></p>
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;<ul type="disc">
                <li class="MsoNormal"><b><span>委託人</span><span lang="EN-US">(</span><span>飼主</span><span lang="EN-US">):</span></b><span lang="EN-US">&nbsp;</span><span class="auto-style4" lang="EN-US">________</span><span lang="EN-US"><o:p></o:p></span></li>
                <li class="MsoNormal"><b><span>受託人</span><span lang="EN-US">(</span><span>保姆</span><span lang="EN-US">):</span></b><span lang="EN-US">&nbsp;</span><span class="auto-style5">iP<span class="auto-style2">etGO</span></span><span lang="EN-US"><o:p></o:p></span></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <p class="MsoNormal">
                    <span>雙方協議經由</span><span lang="EN-US"> &quot;<span class="auto-style5">iP<span class="auto-style2">etGO</span></span><o:p></o:p> </span><span>寵物保姆</span><span lang="EN-US">&quot;</span><span>媒合</span><span lang="EN-US">, </span><span>預約寵物服務並訂立接待契約</span><span lang="EN-US">, </span><span>約定條款如下。</span></p>
                <p class="MsoNormal">
                    <span>本契約在家長付款</span><span lang="EN-US">(</span><span>若需要付費</span><span lang="EN-US">)</span><span>完成、且保姆接受預約後生效。</span></p>
                <p class="MsoNormal">
                    <span>若服務尚未開始前家長或保姆取消預約</span><span lang="EN-US">, </span><span>本契約自動失效。</span></p>
                <p class="MsoNormal">
                    <span>電子化契約依法與紙本契約同具法律效力。</span><span lang="EN-US"><o:p></o:p></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="MsoNormal">
                    <span>定義</span><span lang="EN-US"><o:p></o:p></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <ul type="disc">
                    <li class="MsoNormal"><b><span>寵物</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>本契約所稱之寵物</span><span lang="EN-US">, </span><span>指家長於網站</span><span lang="EN-US">&quot;</span><span>我的毛小孩</span><span lang="EN-US">&quot;</span><span>裡所列之</span><span lang="EN-US">&nbsp;</span><b><span lang="EN-US">________</span></b><span>。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>家長</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>本契約所稱之家長</span><span lang="EN-US">, </span><span>指寵物飼主或該寵物的緊急聯絡人。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>緊急聯絡人</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>本契約所稱之緊急聯絡人</span><span lang="EN-US">, </span><span>指在寵物有緊急醫療情況發生時</span><span lang="EN-US">, </span><span>保姆應聯絡的對象。聯急聯絡人為</span><span lang="EN-US">&nbsp;</span><b><span lang="EN-US">________, </span><span>電話</span><span lang="EN-US"> ________</span></b><span>。</span><span lang="EN-US"><o:p></o:p></span></li>
                   
                    <li class="MsoNormal"><b><span>時數計算</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>本契約的計時方式</span><span lang="EN-US">, </span><span>未滿一小時的時數以四捨五入到小時為單位。安親與住宿未滿一天的時數若超過</span><span lang="EN-US">&nbsp;</span><b><span lang="EN-US">6</span></b><span lang="EN-US">&nbsp;</span><span>小時</span><span lang="EN-US">, </span><span>以住宿一天計算。</span><span lang="EN-US"><o:p></o:p></span></li>
                  
                </ul>
            </td>
        </tr>
       
       
        <tr>
            <td>
                <p class="MsoNormal">
                    <span>費用</span><span lang="EN-US"><o:p></o:p></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="MsoNormal">
                    <span>以第三方支付平台支付共</span><b><span>新台幣</span><span lang="EN-US"> ____<span class="auto-style7">500</span>____ </span><span>元整</span></b><span>。</span><span lang="EN-US"><o:p></o:p></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <ul type="disc">
                    <li class="MsoNormal"><b><span>付款</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>家長應於預約成立同時支付至第三方支付平台。第三方支付平台於保姆服務完畢</span><span lang="EN-US">, </span><span>確認雙方無糾紛後付款給保姆。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>退款</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>若家長提早接回</span><span lang="EN-US">, </span><span>家長應在接回日通知</span><span lang="EN-US"> PawsVilla, PawsVilla </span><span>應按天數比例退還剩餘寵物照顧費用。</span><span lang="EN-US"><o:p></o:p></span></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
                <p class="MsoNormal">
                    <span>限制、權利與義務</span><span lang="EN-US"><o:p></o:p></span></p>
            </td>
        </tr>
        <tr>
            <td>
                <ul type="disc">
                    <li class="MsoNormal"><b><span>固定場所</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>未經家長同意</span><span lang="EN-US">, </span><span>除了溜狗與緊急醫療等情況下</span><span lang="EN-US">, </span><span>保姆不得將寵物帶離代養場所、轉售、轉讓或以其他變相方法作為其他用途</span><span lang="EN-US">, </span><span>如有違反此項之情事</span><span lang="EN-US">, </span><span>經查屬實</span><span lang="EN-US">, </span><span>保姆應全額退費</span><span lang="EN-US">, </span><span>絕無異議。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>授權進出</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>若委託事項為到府服務</span><span lang="EN-US">, </span><span>家長授權保姆在上述時間內進入家長居住場所。家長須將貴重物品妥善安置</span><span lang="EN-US">, </span><span>若有物品遺失保姆不負責監視保管責任。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>移動</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>代養期間</span><span lang="EN-US">, </span><span>寵物有醫療、美容、接送之必要時</span><span lang="EN-US">, </span><span>保姆須告知家長或該寵物的緊急聯絡人並取得同意使得為之。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>逾時接回</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>家長於本接待契約終止或期滿</span><span lang="EN-US">, </span><span>除經保姆同意繼續留宿外</span><span lang="EN-US">, </span><span>應於約定期間內將寵物領回；逾期者家長同意每小時以</span><b><span>新台幣</span><span lang="EN-US"> 100 </span><span>元</span></b><span>計算。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>棄養</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>若家長在逾期超過</span><span lang="EN-US"> 48 </span><span>小時仍未接回</span><span lang="EN-US">, </span><span>視作惡意棄養</span><span lang="EN-US">, </span><span>保姆得依動物保護法處置或送養他人</span><span lang="EN-US">, </span><span>並得將代養時所附之食</span><span lang="EN-US"> / </span><span>用品</span><span lang="EN-US">, </span><span>作為送養時贈送收養人之用</span><span lang="EN-US">, </span><span>家長不得主張任何權利。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>防疫除蟲</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>寵物必須完成年度疫苗注射與定期除蚤</span><span lang="EN-US">, </span><span>必要時保姆可要求家長提供證明。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>飼主的告知責任</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>飼主的寵物之健康情形、飼養需知、行為習性等需盡到告知保姆的義務</span><span lang="EN-US">, </span><span>如有欺瞞不實者所致飼主的寵物感染疾病、傷害、遺失、死亡等</span><span lang="EN-US">, </span><span>保姆概不負責</span><span lang="EN-US">; </span><span>若因飼主未盡告知責任造成保姆受傷</span><span lang="EN-US">, </span><span>或保姆之寵物受傳染疾病、傷害、死亡</span><span lang="EN-US">, </span><span>則費用由家長承擔。若飼主已善盡告知責任</span><span lang="EN-US">, </span><span>仍導致飼主的寵物感染疾病、傷害、遺失、死亡等</span><span lang="EN-US">, </span><span>則費用由保姆承擔</span><span lang="EN-US">; </span><span>若飼主已盡告知責任仍造成保姆受傷</span><span lang="EN-US">, </span><span>或保姆之寵物受疾病傳染、傷害、死亡</span><span lang="EN-US">, </span><span>則費用由保姆承擔。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>保姆的告知責任</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>保姆的寵物之健康情形、行為習性等需善盡到告知飼主的義務</span><span lang="EN-US">, </span><span>如有欺瞞不實者所致飼主的寵物受疾病傳染、傷害、遺失、死亡等</span><span lang="EN-US">, </span><span>保姆應負擔賠償責任。若保姆已盡告知義務</span><span lang="EN-US">, </span><span>仍導致飼主的寵物疾病、傷害、遺失、死亡等</span><span lang="EN-US">, </span><span>則由飼主承擔責任。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>醫療隔離</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>若代養期間發現寵物具攻擊性、傳染病、傳染性寄生蟲或嚴重吠叫使保姆遭投訴之情形</span><span lang="EN-US">, </span><span>得請家長將寵物領回或由保姆通知</span><span lang="EN-US"> PawsVilla </span><span>另行安置</span><span lang="EN-US">, </span><span>且一切費用由家長承擔。若家長已善盡告知義務</span><span lang="EN-US">, </span><span>而保姆仍選擇照顧</span><span lang="EN-US">, </span><span>則另行安置費或洐生出的其他費用</span><span lang="EN-US">, </span><span>需由保母及家長共同承擔。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>賠償費用</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>凡因保姆故意或過失</span><span lang="EN-US">, </span><span>致寵物有疾病、傷害、遺失、死亡等</span><span lang="EN-US">, </span><span>保姆應負責醫療費用及損害賠償之責</span><span lang="EN-US">, </span><span>最高賠償金額上限為該次代養費用的</span><span lang="EN-US"> 30 </span><span>倍；非可歸責於保姆之事由</span><span lang="EN-US">, </span><span>致寵物有上述之情事</span><span lang="EN-US">, </span><span>家長應負責相關費用。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>年老寵物</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>凡小型</span><span lang="EN-US">/</span><span>中型犬</span><span lang="EN-US"> 8 </span><span>歲</span><span lang="EN-US">, </span><span>或大型</span><span lang="EN-US">/</span><span>超大型犬</span><span lang="EN-US"> 6 </span><span>歲以上之年老寵物</span><span lang="EN-US">, </span><span>須於代養前確認其健康狀況</span><span lang="EN-US">, </span><span>保姆善盡日常照顧之責。若為自然、身體因素致其傷亡</span><span lang="EN-US">, </span><span>家長須自行承擔責任。</span><span lang="EN-US"><o:p></o:p></span></li>
                    <li class="MsoNormal"><b><span>保姆無法完成服務</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>代養期間</span><span lang="EN-US">, </span><span>因任何緊急因素導致保姆無法完成服務</span><span lang="EN-US">, </span><span>應於第一時間通知家長或緊急聯絡人並取得同意</span><span lang="EN-US">, </span><span>得由</span><span lang="EN-US"> PawsVilla </span><span>安排將寵物送至其他保姆家中安置</span><span lang="EN-US">, </span><span>且一切費用按服務時數等比例扣除後</span><span lang="EN-US">, </span><span>支付給受託保姆。</span><span lang="EN-US"><o:p></o:p></span></li>
                </ul>
                <b><span>就醫優先順序</span><span lang="EN-US">:</span></b><span lang="EN-US">&nbsp;</span><span>在有緊急醫療狀況發生時</span><span lang="EN-US">, </span><span>保姆應依以下優先順序與考量營業時間將寵物送至動物醫院治療</span><span lang="EN-US">:&nbsp;</span><b><span lang="EN-US">________, ________, ________</span></b><span lang="EN-US">&nbsp;</span><span>動物醫院。家長同意一切醫療相關病因、診斷皆由該動物醫院進行鑑定。</span></td>
        </tr>
        <tr>
            <td>
                <p class="MsoNormal">
                    <span>預約狀態</span><span lang="EN-US"><o:p></o:p></span></p>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <p class="MsoNormal">
                    <b><span lang="EN-US">(</span><span>時間</span><span lang="EN-US">1): (</span><span>某方</span><span lang="EN-US">) (</span><span>某動作</span><span lang="EN-US">)<o:p></o:p></span></b></p>
                <p class="MsoNormal">
                    <b><span lang="EN-US">(</span><span>時間</span><span lang="EN-US">2): (</span><span>某方</span><span lang="EN-US">) (</span><span>某動作</span><span lang="EN-US">)<o:p></o:p></span></b></p>
                <p class="MsoNormal">
                    <b><span lang="EN-US">(</span><span>系統自動更新狀態</span><span lang="EN-US">)<o:p></o:p></span></b></p>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <strong><a href="Reservation.aspx">[返回預約頁面]</a></strong></td>
        </tr>
    </table>
</asp:Content>

