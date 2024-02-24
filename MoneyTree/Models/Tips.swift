//
//  Tips.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-02-24.
//

import Foundation

struct Tips {
    
    private static var en = [
        "Start saving early and consistently.",
        "Understand the difference between needs and wants.",
        "Set specific financial goals and work towards achieving them.",
        "Always look for ways to save money, like using coupons or shopping sales.",
        "Learn about budgeting and track your expenses.",
        "Avoid impulse buying and think carefully before making a purchase.",
        "Consider investing your money for long-term growth.",
        "Earn and save money through chores or a part-time job.",
        "Don’t be afraid to ask questions about money and personal finance.",
        "Be mindful of your spending habits and avoid unnecessary expenses.",
        "Learn to prioritize your financial goals and make smart choices.",
        "Start a savings account and watch your money grow.",
        "Always read the fine print before signing any financial agreements.",
        "Seek guidance from a trusted adult or financial advisor when needed.",
        "Set up a budget for your allowances and stick to it.",
        "Take advantage of educational resources on money management.",
        "Compare prices and look for the best deals before making a purchase.",
        "Avoid borrowing money unless absolutely necessary.",
        "Learn the basics of interest rates and how they affect your savings.",
        "Consider the long-term implications of your financial decisions.",
        "Stay informed about the current state of the economy and how it may impact your finances.",
        "Save a portion of any money received as a gift or allowance.",
        "Consider starting a small business or selling items to earn extra income.",
        "Invest in your education and future earning potential.",
        "Prepare for unexpected expenses by building an emergency fund.",
        "Avoid falling into the trap of keeping up with others’ spending habits.",
        "Learn about the concept of compound interest and how it can work in your favor.",
        "Seek out financial literacy programs or workshops to improve your knowledge.",
        "Learn to negotiate and advocate for yourself in financial matters.",
        "Teach others about the importance of financial responsibility and good money habits.",
        "Find ways to make money work for you through smart investments.",
        "Consider the environmental and social impact of your purchases.",
        "Learn to distinguish between short-term gratification and long-term financial security.",
        "Be wary of scams and fraudulent financial schemes.",
        "Think about the value of experiences over material possessions.",
        "Consider the costs and benefits of higher education and student loans.",
        "Save a portion of your earnings for charitable donations or giving back to the community.",
        "Build a strong credit history by using credit responsibly.",
        "Consider the importance of insurance in protecting your financial well-being.",
        "Take risks and explore new opportunities for financial growth.",
        "Learn to set boundaries and say ‘no’ to unnecessary purchases.",
        "Avoid comparing yourself to others based on material possessions.",
        "Practice patience and discipline in your financial decisions.",
        "Seek out mentors or role models who can offer guidance on financial matters.",
        "Be mindful of the environmental impact of your financial choices.",
        "Invest in experiences and relationships that bring long-term happiness.",
        "Consider the impact of your financial decisions on future generations.",
        "Take responsibility for your financial future and work towards financial independence.",
        "Stay informed about changes in the financial landscape and adapt accordingly.",
        "Remember that financial success is not just about wealth, but also about happiness and fulfillment."
    ]
    
    private static var zhs = [
        "尽早开始储蓄并持之以恒",
        "了解需求和愿望之间的区别",
        "设定具体的财务目标，并为实现目标而努力",
        "经常寻找省钱的方法，如使用优惠券或购物促销",
        "了解预算编制并跟踪支出",
        "避免冲动购物，购买前仔细考虑",
        "考虑将钱用于投资，以实现长期增长",
        "通过做家务或兼职来赚钱和存钱",
        "不要害怕问有关金钱和个人理财的问题",
        "注意自己的消费习惯，避免不必要的开支",
        "学会优先考虑自己的财务目标，做出明智的选择",
        "开设一个储蓄账户，看着你的钱越来越多",
        "在签署任何财务协议之前，一定要仔细阅读协议内容",
        "必要时寻求可信赖的成年人或财务顾问的指导",
        "为自己的津贴制定预算并坚持下去",
        "利用有关理财的教育资源",
        "在购物前比较价格，寻找最优惠的价格",
        "除非万不得已，避免借钱",
        "了解利率的基本知识以及利率对储蓄的影响",
                
        "考虑财务决策的长期影响",
        "随时了解当前的经济状况及其可能对您的财务产生的影响",
        "将收到的礼物或零用钱的一部分存起来",
        "考虑做小生意或出售物品以赚取额外收入",
        "投资于你的教育和未来的收入潜力",
        "建立应急基金，为意外支出做好准备",
        "避免陷入追赶他人消费习惯的陷阱",
        "了解复利的概念以及它如何对你有利",
        "寻求金融扫盲计划或研讨会来提高自己的知识水平",
        "学会在财务问题上为自己谈判和辩护",
        "向他人传授财务责任和良好理财习惯的重要性",
        "通过明智的投资，找到让金钱为您服务的方法",
        "考虑购物对环境和社会的影响",
        "学会区分短期满足和长期财务安全",
        "警惕骗局和欺诈性金融计划",
        "考虑经验的价值，而不是物质财富的价值",
        "考虑高等教育和学生贷款的成本和收益",
    ]
    
    private static var zht = [
        "儘早開始儲蓄並持之以恆",
        "了解需求與願望的差別",
        "設定具體的財務目標，並為實現目標而努力",
        "經常尋找省錢的方法，如使用優惠券或購物促銷",
        "了解預算編制並追蹤支出",
        "避免衝動購物，購買前仔細考慮",
        "考慮將錢用於投資，以實現長期成長",
        "透過做家事或兼職來賺錢和存錢",
        "不要害怕問有關金錢和個人理財的問題",
        "注意自己的消費習慣，避免不必要的開支",
        "學會優先考慮自己的財務目標，做出明智的選擇",
        "開一個儲蓄帳戶，看著你的錢越來越多",
        "在簽署任何財務協議之前，請務必仔細閱讀協議內容",
        "必要時尋求可信賴的成年人或財務顧問的指導",
        "為自己的津貼制定預算並堅持下去",
        "利用有關理財的教育資源",
        "購物前先比較價格，找出最優惠的價格",
        "除非萬不得已，避免借錢",
        "了解利率的基本知識以及利率對儲蓄的影響",
        
        "考慮財務決策的長期影響",
        "隨時了解當前的經濟狀況及其可能對您的財務產生的影響",
        "將收到的禮物或零用錢的一部分存起來",
        "考慮做小生意或出售物品以賺取額外收入",
        "投資你的教育與未來的收入潛力",
        "建立應急基金，為意外支出做好準備",
        "避免陷入追趕他人消費習慣的陷阱",
        "了解複利的概念以及它如何對你有利",
        "尋求金融掃盲計畫或研討會來提升自己的知識水平",
        "學習在財務問題上為自己談判和辯護",
        "向他人傳授財務責任及良好理財習慣的重要性",
        "透過明智的投資，找到讓金錢為您服務的方法",
        "考慮購物對環境和社會的影響",
        "學習區分短期滿足與長期財務安全",
        "警惕騙局與詐欺性金融計畫",
        "考慮經驗的價值，而不是物質財富的價值",
        "考慮高等教育和學生貸款的成本和收益",
    ]
    
    private static func random() -> String {
        // get current device language
        let preferredLanguage = Locale.preferredLanguages[0]
        
        return switch preferredLanguage {
            case "zh-Hant":
                zht.randomElement()
            case "zh-Hans":
                zhs.randomElement()
            default:
                en.randomElement()
        }
    }
}
