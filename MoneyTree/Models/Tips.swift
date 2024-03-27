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
        "每周存一点零花钱🌱，看着它像金钱花园一样成长！",
        "为你真正想要的特别东西设定一个储蓄目标 🎯",
        "学会区分 \"我需要 \"和 \"我想要\" 🤔",
        "向父母要一个很酷的存钱罐 🐷，让储蓄变得有趣！",
        "通过帮忙做家务或小任务来赚外快 💼",
        "创建一个简单的预算，记录你的支出和储蓄 📊",
        "在购买玩具之前，想想它会给你带来多少快乐 😊" ,
        "为意外支出建立一个储蓄垫 💰，有备无患！",
        "不要害羞--向家人或朋友请教省钱秘诀 💡",
        "从收到的礼金中节省一部分 🎁",
        "从小额储蓄开始，看着它们随着时间的推移不断增加 ⏳",
        "设定一个目标，为与朋友外出游玩而储蓄 🚀",
        "寻找折扣和销售，就像发现隐藏的宝藏！ 💎",
        "考虑开设一个储蓄账户 💼，这是明智的理财之举！",
        "用罐子来整理您的钱--为它们贴上储蓄,消费和分享的标签 🏦",
        "购物前比较价格，以获得最佳交易 💸",
        "避免借钱，除非确有必要 🚫",
        "了解利率以及利率如何帮助您的储蓄增长 📈",
        "考虑您的消费决定的长期影响 🤔",
        "保持对金钱事务的了解，这是你的超级能力！🦸‍♂️",
        "从零花钱中节省一点，为将来的大采购做准备 🛍️",
        "考虑做点小生意，比如出售手工艺品 🛠️",
        "投资学习新知识，这是对自己的投资 📘 ！",
        "建立一笔应急基金，以备不时之需 💼",
        "避免试图跟上别人的步伐，对自己拥有的东西感到满意 😊",
        "了解复利的概念，它就像储蓄的助推器！ ⚡",
        "参加金融扫盲课程，提高你的理财技能 🎓",
        "与父母协商，获得公平的津贴和奖励 🤝",
        "教你的朋友如何省钱和做出明智的选择 🧠",
        "通过明智的储蓄和投资，让你的钱为你工作 🌐",
        "考虑购买物品对环境的影响 🌍",
        "区分短期需求和长期财务目标 🎯",
        "谨防诈骗，保护您的钱财！🚨",
        "重视体验而非物质财富，才能获得持久的幸福 🌈",
        "考虑教育和学生贷款的成本和收益 🎓",
        "将收入的一部分用于慈善或帮助他人 🤲",
        "用你的钱建立良好的声誉，做一个负责任和诚实的人 🌟",
        "考虑保险对保护您的未来的重要性 🛡️",
        "探索财务增长和学习的新机会 🚀",
        "学会对不必要的消费说 \"不\"，专注于必需品 🚫",
        "避免与他人比较，每个人的财务历程都是独一无二的 🌟",
        "在理财时要有耐心和纪律性 🧘",
        "就财务问题向值得信赖的成年人或导师寻求建议 🤝",
        "注意您的财务选择对环境的影响 🌳",
        "投资于能带来长期快乐的体验和关系 💖",
        "考虑您的财务决策对子孙后代的影响 🌐",
        "为自己的财务未来负责，并享受这段旅程 🚀",
        "随时了解金融世界的变化，并做出相应调整 📰",
        "记住，财务成功不仅仅是钱的问题，而是幸福和成就感的问题 🌟"
    ]
    
    private static var zht = [
        "每週存一點零用錢🌱，看著它像金錢花園一樣成長！",
        "為你真正想要的特別東西設定一個儲蓄目標 🎯",
        "學會區分 \"我需要 \"和 \"我想要\" 🤔",
        "向父母要一個很酷的存錢筒 🐷，讓儲蓄變得有趣！",
        "透過幫忙做家事或小任務來賺外快 💼",
        "建立一個簡單的預算，記錄你的支出和儲蓄 📊",
        "在購買玩具之前，想想它會帶給你多少快樂 😊" ,
        "為意外支出建立一個儲蓄墊 💰，有備無患！",
        "別害羞--向家人或朋友請教省錢秘訣 💡",
        "從收到的禮金中節省一部分 🎁",
        "從小額儲蓄開始，看著它們隨著時間的推移不斷增加 ⏳",
        "設定目標，為與朋友外出遊玩而儲蓄 🚀",
        "尋找折扣和銷售，就像發現隱藏的寶藏！💎",
        "考慮開立儲蓄帳戶 💼，這是明智的理財之舉！",
        "用罐子來整理您的錢--為它們貼上儲蓄,消費和分享的標籤 🏦",
        "購物前比較價格，以獲得最佳優惠 💸",
        "避免借錢，除非確有必要 🚫",
        "了解利率以及利率如何幫助您的儲蓄成長 📈",
        "考慮您的消費決定的長期影響 🤔",
        "保持對金錢事務的了解，這是你的超級能力！🦸‍♂️",
        "從零用錢中節省一點，為將來的大採購做準備 🛍️",
        "考慮做點小生意，例如賣手工藝品 🛠️",
        "投資學習新知識，這是對自己的投資 📘 ！",
        "建立一筆應急基金，以備不時之需 💼",
        "避免試圖跟上別人的步伐，對自己擁有的東西感到滿意 😊",
        "了解複利的概念，它就像儲蓄的助推器！⚡",
        "參加金融掃盲課程，提升你的理財技能 🎓",
        "與父母協商，獲得公平的津貼和獎勵 🤝",
        "教你的朋友如何省錢和做出明智的選擇 🧠",
        "透過明智的儲蓄和投資，讓你的錢為你工作 🌐",
        "考慮購買物品對環境的影響 🌍",
        "區分短期需求與長期財務目標 🎯",
        "要小心詐騙，保護您的錢財！🚨",
        "重視體驗而非物質財富，才能獲得持久的幸福 🌈",
        "考慮教育和學生貸款的成本和收益 🎓",
        "將收入的一部分用於慈善或幫助他人 🤲",
        "用你的錢建立良好的聲譽，做一個負責任和誠實的人 🌟",
        "考慮保險對保護您的未來的重要性 🛡️",
        "探索財務成長與學習的新機會 🚀",
        "學習對不必要的消費說 \"不\"，專注於必需品 🚫",
        "避免與他人比較，每個人的財務歷程都是獨一無二的 🌟",
        "在理財時要有耐心和紀律性 🧘",
        "就財務問題向值得信賴的成年人或導師尋求建議 🤝",
        "注意您的財務選擇對環境的影響 🌳",
        "投資於能帶來長期快樂的體驗與關係 💖",
        "考慮您的財務決策對子孫後代的影響 🌐",
        "為自己的財務未來負責，並享受這段旅程 🚀",
        "隨時了解金融世界的變化，並做出相應調整 📰",
        "記住，財務成功不僅僅是錢的問題，而是幸福和成就感的問題 🌟"
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
        
        print("preferredLanguage: \(preferredLanguage)")
        
        return switch preferredLanguage {
        case let lang where lang.hasPrefix("zh-Hant"):
            zht.randomElement() ?? ""
        case let lang where lang.hasPrefix("zh-Hans"):
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
