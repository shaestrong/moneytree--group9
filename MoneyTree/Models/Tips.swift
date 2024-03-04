//
//  Tips.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-02-24.
//

import Foundation

struct Tips {
    
    private static var en = [
        "Save a bit of your allowance each week 🌱, watch it grow like a money garden!",
        "Set a savings goal for something special you really want 🎯.",
        "Learn the difference between 'I need it' and 'I want it' 🤔.",
        "Ask your parents for a cool piggy bank 🐷, it makes saving fun!",
        "Earn extra money by helping with chores or small tasks 💼.",
        "Create a simple budget to keep track of your spending and saving 📊.",
        "Before buying a toy, think about how much joy it will bring you 😊.",
        "Build a savings cushion for unexpected expenses 💰, be prepared!",
        "Don’t be shy—ask your family or friends for money-saving tips 💡.",
        "Save a portion of any gift money you receive 🎁.",
        "Start with small savings and watch them add up over time ⏳.",
        "Set a goal to save for a fun outing with your friends 🚀.",
        "Look for discounts and sales, it's like finding hidden treasures! 💎",
        "Consider opening a savings account 💼, it's a smart money move!",
        "Use jars to organize your money—label them for saving, spending, and sharing 🏦.",
        "Compare prices before making a purchase to get the best deal 💸.",
        "Avoid borrowing money unless it's really necessary 🚫.",
        "Learn about interest rates and how they can help your savings grow 📈.",
        "Think about the long-term impact of your spending decisions 🤔.",
        "Stay informed about money matters, it's your superpower! 🦸‍♂️",
        "Save a little from your allowance for future big purchases 🛍️.",
        "Consider starting a small business, like selling handmade crafts 🛠️.",
        "Invest in learning new things, it's an investment in yourself 📘!",
        "Build an emergency fund for unexpected expenses 💼.",
        "Avoid trying to keep up with others, be happy with what you have 😊.",
        "Understand the concept of compound interest, it's like a savings booster! ⚡",
        "Join financial literacy programs to improve your money skills 🎓.",
        "Negotiate with your parents for fair allowances and rewards 🤝.",
        "Teach your friends about saving money and making wise choices 🧠.",
        "Make your money work for you by saving and investing wisely 🌐.",
        "Think about the environmental impact of your purchases 🌍.",
        "Distinguish between short-term wants and long-term financial goals 🎯.",
        "Be cautious of scams and fraudulent schemes, protect your money! 🚨",
        "Value experiences over material possessions for lasting happiness 🌈.",
        "Consider the costs and benefits of education and student loans 🎓.",
        "Save a portion of your earnings for charity or helping others 🤲.",
        "Build a good reputation with your money, be responsible and honest 🌟.",
        "Consider the importance of insurance in protecting your future 🛡️.",
        "Explore new opportunities for financial growth and learning 🚀.",
        "Learn to say 'no' to unnecessary purchases and focus on essentials 🚫.",
        "Avoid comparing yourself to others, everyone's financial journey is unique 🌟.",
        "Practice patience and discipline in managing your money 🧘.",
        "Seek advice from trustworthy adults or mentors on financial matters 🤝.",
        "Be mindful of the environmental impact of your financial choices 🌳.",
        "Invest in experiences and relationships that bring long-term joy 💖.",
        "Consider the impact of your financial decisions on future generations 🌐.",
        "Take responsibility for your financial future and enjoy the journey 🚀.",
        "Stay informed about changes in the financial world and adapt accordingly 📰.",
        "Remember, financial success is not just about money, it's about happiness and fulfillment 🌟."
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
    
    private static var es = [
        "Ahorra un poco de tu asignación cada semana 🌱, ¡míralo crecer como un jardín de dinero!",
        "Establece un objetivo de ahorro para algo especial que realmente deseas 🎯.",
        "Aprende la diferencia entre 'Lo necesito' y 'Lo quiero' 🤔.",
        "Pídele a tus padres una alcancía genial 🐷, ¡hace que ahorrar sea divertido!",
        "Gana dinero extra ayudando con quehaceres o tareas pequeñas 💼.",
        "Crea un presupuesto simple para llevar un registro de tus gastos y ahorros 📊.",
        "Antes de comprar un juguete, piensa en cuánta alegría te traerá 😊.",
        "Construye un colchón de ahorros para gastos inesperados 💰, ¡estate preparado!",
        "No seas tímido, pídele a tu familia o amigos consejos para ahorrar dinero 💡.",
        "Ahorra una parte de cualquier dinero que recibas como regalo 🎁.",
        "Comienza con pequeños ahorros y míralos sumarse con el tiempo ⏳.",
        "Establece un objetivo para ahorrar para una salida divertida con tus amigos 🚀.",
        "¡Busca descuentos y ofertas, es como encontrar tesoros escondidos! 💎",
        "Considera abrir una cuenta de ahorros 💼, ¡es una movida financiera inteligente!",
        "Usa frascos para organizar tu dinero, etiquétalos para ahorros, gastos y compartir 🏦.",
        "Compara precios antes de realizar una compra para obtener la mejor oferta 💸.",
        "Evita pedir dinero prestado a menos que sea realmente necesario 🚫.",
        "Aprende sobre las tasas de interés y cómo pueden ayudar a que tus ahorros crezcan 📈.",
        "Piensa en el impacto a largo plazo de tus decisiones de gasto 🤔.",
        "Mantente informado sobre temas financieros, ¡es tu superpoder! 🦸‍♂️",
        "Ahorra un poco de tu asignación para compras grandes en el futuro 🛍️.",
        "Considera comenzar un pequeño negocio, como vender manualidades hechas a mano 🛠️.",
        "Invierte en aprender cosas nuevas, ¡es una inversión en ti mismo 📘!",
        "Crea un fondo de emergencia para gastos inesperados 💼.",
        "Evita tratar de seguir el ritmo de los demás, sé feliz con lo que tienes 😊.",
        "Entiende el concepto de interés compuesto, ¡es como un potenciador de ahorros! ⚡",
        "Únete a programas de educación financiera para mejorar tus habilidades financieras 🎓.",
        "Negocia con tus padres para obtener asignaciones y recompensas justas 🤝.",
        "Enseña a tus amigos sobre cómo ahorrar dinero y tomar decisiones sabias 🧠.",
        "Haz que tu dinero trabaje para ti ahorrando e invirtiendo sabiamente 🌐.",
        "Piensa en el impacto ambiental de tus compras 🌍.",
        "Distingue entre deseos a corto plazo y metas financieras a largo plazo 🎯.",
        "Ten precaución con estafas y esquemas financieros fraudulentos, ¡protege tu dinero! 🚨",
        "Valora experiencias sobre posesiones materiales para una felicidad duradera 🌈.",
        "Considera los costos y beneficios de la educación y los préstamos estudiantiles 🎓.",
        "Ahorra una parte de tus ganancias para caridad o ayudar a otros 🤲.",
        "Construye una buena reputación con tu dinero, sé responsable y honesto 🌟.",
        "Considera la importancia del seguro para proteger tu futuro 🛡️.",
        "Explora nuevas oportunidades para el crecimiento financiero y el aprendizaje 🚀.",
        "Aprende a decir 'no' a compras innecesarias y concéntrate en lo esencial 🚫.",
        "Evita compararte con los demás, ¡el viaje financiero de cada uno es único 🌟.",
        "Practica la paciencia y la disciplina en la gestión de tu dinero 🧘.",
        "Busca consejo de adultos o mentores de confianza sobre asuntos financieros 🤝.",
        "Sé consciente del impacto ambiental de tus decisiones financieras 🌳.",
        "Invierte en experiencias y relaciones que traigan alegría a largo plazo 💖.",
        "Considera el impacto de tus decisiones financieras en las generaciones futuras 🌐.",
        "Asume la responsabilidad de tu futuro financiero y disfruta del viaje 🚀.",
        "Mantente informado sobre los cambios en el mundo financiero y adáptate en consecuencia 📰.",
        "Recuerda, el éxito financiero no solo se trata de dinero, ¡también es felicidad y realización 🌟."
    ]
    
    private static func random() -> String {
        // get current device language
        let preferredLanguage = Locale.preferredLanguages[0]
        
        return switch preferredLanguage {
        case "zh-Hant":
            zht.randomElement() ?? ""
        case "zh-Hans":
            zhs.randomElement() ?? ""
        case let lang where lang.hasPrefix("es"):
            es.randomElement() ?? ""
        default:
            en.randomElement() ?? ""
        }
    }
    
    public static func getRandomTip() -> String {
        return random()
    }
}
