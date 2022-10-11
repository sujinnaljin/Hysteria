//
//  Datasource.swift
//  Hysteria
//
//  Created by 강수진 on 2022/10/11.
//

import Foundation

struct Sentence {
    let korean: String
    let english: String
    let chinese: String
}

struct SentenceGroup {
    let sentences: [Sentence]
    
    init(sentences: [Sentence]) {
        self.sentences = sentences
    }
    
    init(sentence: Sentence) {
        self.sentences = [sentence]
    }
    
    init(korean: String, english: String, chinese: String) {
        self.init(sentence: Sentence(korean: korean, english: english, chinese: chinese))
    }
}

struct Datasource {
    private let sentenceGroups: [SentenceGroup]
    
    func selectRandomLanguage() -> [String] {
        let selectedSentences = sentenceGroups.map { sentenceGroup in
            selectRandomLanguage(from: sentenceGroup.sentences)
        }
        return selectedSentences
    }
    
    private func selectRandomLanguage(from sentences: [Sentence]) -> String {
        return sentences.map { sentence in
            return selectRandomLanguage(from: sentence)
        }.joined(separator: " ")
    }
    
    private func selectRandomLanguage(from sentence: Sentence) -> String {
        let candidates = [sentence.korean, sentence.english, sentence.chinese]
        return candidates.randomElement() ?? ""
    }
    
    init() {
        let sentenceGroups = [SentenceGroup(korean: "진주에 기생이 많았다고 해도",
                                            english: "There were a lot of Jinju kisaeng,",
                                            chinese: "晋州有很多妓女"),
                              SentenceGroup(korean: "우리 집안에는 그런 여자 없었다 한다",
                                            english: "but I’ve been told our family didn’t have any.",
                                            chinese: "但有人告诉我，我们家没有。"),
                              SentenceGroup(korean: "지리산 자락 아래 진주 기생이 이 나라 가장 오랜 기생 역사를 갖고 있다지만",
                                            english: "The Jinju kisaeng who lived under the skirts of Mt. Jiri have the longest history,",
                                            chinese: "住在智里山下的晋州妓女历史最悠久，"),
                              SentenceGroup(korean: "우리 집안에 열녀는 있어도 기생은 없었단다",
                                            english: "but our family had only chaste women. No kisaeng.",
                                            chinese: "但是我们家只有贞洁的女人。没有妓女。"),
                              SentenceGroup(korean: "백정이나 노비, 상인 출신도 없는 사대부 선비 집안이었다며 아버지는 족보를 외우신다",
                                            english: "When Father reads from the family register he lists nobles and scholars. No peasants, slaves, or merchants.",
                                            chinese: "父亲从户口本上看的时候 他列出了贵族和学者。没有农民、奴隶或商人。"),
                              SentenceGroup(korean: "낮에 우리는 촉석루 앞마당에서 진주교방 굿거리춤을 보고 있었다",
                                            english: "One afternoon we watched the Jinjukyobang shaman dance in the Chokseoknu pavillion.",
                                            chinese: "一天下午，我们在矗石楼亭观看了晋州教坊萨满舞。"),
                              SentenceGroup(korean: "색한삼 양손에 끼고 버선발로 검무를 추는 여자와 눈이 맞았다",
                                            english: "I met eyes with a woman performing a sword dance. She was wearing socks and traditional and brightly colored cloth covered her hands.",
                                            chinese: "我看到一个正在表演剑舞的女人\n她穿着袜子和传统的颜色鲜艳的布盖在她的手上。"),
                              SentenceGroup(korean: "",
                                            english: "",
                                            chinese: ""),
                              SentenceGroup(korean: "집안 조상 중에 기생 하나 없었다는 게 이상하다",
                                            english: "How did we not have any kisaeng in our family?",
                                            chinese: "我们家怎么没有妓女？"),
                              SentenceGroup(korean: "창가에 달 오르면 부푼 가슴으로 가야금을 뜯던 관비 고모도 없고",
                                            english: "That we didn’t have a government slave aunt who plucked a gayakeum with a fluffed heart when the moon rose by the window,",
                                            chinese: "当月亮从窗边升起时，我们没有一个政府的奴隶阿姨在一颗蓬松的心上采摘了一个伽倻琴，"),
                              SentenceGroup(korean: "술자리 시중이 싫어 자결한 할미도 없다는 거",
                                            english: "a grandmother who killed herself because she didn’t like attending to drinking parties,",
                                            chinese: "一位因不喜欢参加酒会而自杀的祖母，"),
                              SentenceGroup(korean: "인물 좋았던 계집종 어미도 없었고",
                                            english: "a beautiful slave girl mother,",
                                            chinese: "一个美丽的女奴母亲，"),
                              SentenceGroup(korean: "색색비단을 팔러 강을 건너던 삼촌도 없었다는 거",
                                            english: "an uncle who crossed rivers to peddle colorful silk,",
                                            chinese: "渡江兜售彩丝的大叔，"),
                              SentenceGroup(korean: "온갖 멸시와 천대에 칼을 뽑아들었던 백정 할아비도 없었다는 말은",
                                            english: "or a peasant grandfather who pulled out his sword because of contempt and scorn",
                                            chinese: "或者是因为轻蔑和蔑视而拔剑的农民祖父"),
                              SentenceGroup(korean: "너무나 서운하다",
                                            english: "is so disappointing",
                                            chinese: "太令人失望了。"),
                              SentenceGroup(korean: "국란 때마다 나라 구한 조상은 있어도 기생으로 팔려간 딸 하나 없었다는 말은 진짜 쓸쓸하다",
                                            english: "How did we have an ancestor that saved the country every time we faced an insurrection, but not a single daughter who was sold off to be a kisaeng?It’s depressing",
                                            chinese: "每次我们面对起义时，我们的祖先是如何拯救国家的，但没有一个女儿被卖为妓女？\n令人沮丧。"),
                              SentenceGroup(korean: "",
                                            english: "",
                                            chinese: ""),
                              SentenceGroup(korean: "내 마음의 기생은 어디서 왔는가",
                                            english: "So where did the kisaeng in my mind come from?",
                                            chinese: "那么我脑海中的妓女是从哪里来的呢？"),
                              SentenceGroup(korean: "오늘밤 강가에 머물며 영감(靈感)을 뫼실까 하는 이 심정은",
                                            english: "Tonight by the river, I want to be an inspiration.",
                                            chinese: "今晚在河边，我想成为一个灵感。"),
                              SentenceGroup(korean: "영혼이라도 팔아 시 한 줄 얻고 싶은 이 퇴폐를 어찌할까",
                                            english: "What to do with my decadence? My decadence would sell my soul for a single line of a poem.",
                                            chinese: "我的颓废怎么办？我的颓废会为了一首诗出卖我的灵魂。"),
                              SentenceGroup(korean: "밤마다 칼춤을 추는 나의 유흥은 어느 별에 박힌 유전자인가",
                                            english: "Which star is that gene stuck to? My adult entertainment, sword dancing every night,",
                                            chinese: "那个基因粘在哪颗星上？我的成人娱乐，每晚的剑舞，"),
                              SentenceGroup(korean: "나는 사채이자에 묶인 육체파 창녀하고 다를 바 없다",
                                            english: "I’m no different than a physical whore strapped to the indenturement of a private loan.",
                                            chinese: "我和一个被私人贷款契约束缚的肉体妓女没有什么不同。"),
                              SentenceGroup(korean: "",
                                            english: "",
                                            chinese: ""),
                              
                              SentenceGroup(sentences: [Sentence(korean: "나는 기생이다",
                                                                 english: "I'm kisaeng",
                                                                 chinese: "我是一个妓女"),
                                                        Sentence(korean: "위독한 어머니를 위해 팔려간 소녀가 아니다",
                                                                 english: "But I’m not a girl sold off for her sick mother",
                                                                 chinese: ""),
                                                        Sentence(korean: "자발적으로 음란하고 방탕한 감정 창녀다",
                                                                 english: "I’m a voluntarily obscene and debauched emotional whore.",
                                                                 chinese: "我是一个自愿下流和放荡的情感妓女"),
                                                        Sentence(korean: "자다 일어나 하는 기분으로 토하고 마시고 다시 하는 기분으로",
                                                                 english: "I wake up with the feeling of having done it, so I puke and drink and do it again.",
                                                                 chinese: "我醒来时感觉自己已经做完了，所以我吐了又喝，然后再做一次。"),
                                                        Sentence(korean: "헝클어진 머리칼을 흔들며 엉망진창 여럿이 분위기를 살리는 기분으로",
                                                                 english: "I shake my ruffled hair like a person coming to save the mood of a party,",
                                                                 chinese: "我像一个来拯救派对气氛的人一样摇晃着荷叶边的头发,"),
                                                        Sentence(korean: "뭔가를 쓴다",
                                                                 english: "I wake up with the feeling of having done it, so I puke and drink and do it again.",
                                                                 chinese: "我写点东西")
                              ]),
                              
                              SentenceGroup(korean: "",
                                            english: "",
                                            chinese: ""),
                              
                              
                              SentenceGroup(sentences: [Sentence(korean: "다시 나는 진주 남강가를 걷는다",
                                                                 english: "I walk the south side of the Jinju river",
                                                                 chinese: "我走在晋州江的南边"),
                                                        Sentence(korean: "유등 축제가 열리는 밤이다",
                                                                 english: "Tonight is the Yu-deung festival",
                                                                 chinese: "今晚是鱼灯节"),
                                                        Sentence(korean: "취객이 말을 거는 야시장 강변이다",
                                                                 english: "Drunk people at the night market talk at me",
                                                                 chinese: "夜市的醉汉对我说话"),
                                                        Sentence(korean: "다국적의 등불이 강물 위를 떠가고",
                                                                 english: "National flags painted on paper lamps float above",
                                                                 chinese: "画在纸灯上的国旗漂浮在上面。"),
                                                        Sentence(korean: "떠내려가다 엉망진창 걸려있고",
                                                                 english: "They fall into the river and get tangled up",
                                                                 chinese: "他们掉进河里，被缠住了"),
                                                        Sentence(korean: "쏟아져 나온 사람들의 더러운 입김으로 시골 장터는 불야성이다",
                                                                 english: "Lights float on the filthy breaths of people who spill out this country market",
                                                                 chinese: "散落在这个乡村市场的人们的肮脏呼吸上闪烁着灯光,它们赋予夜晚生命")
                              ]),
                              
                              SentenceGroup(korean: "",
                                            english: "",
                                            chinese: ""),
                              
                              SentenceGroup(sentences: [Sentence(korean: "부스스 펜을 꺼낸다 졸린다 펜을 물고",
                                                                 english: "Disheveled and sleepy, I pull out my pen and bite",
                                                                 chinese: "凌乱而困倦，我拔出笔咬了一口"),
                                                        Sentence(korean: "술을 넘쳐 잉크가 번지는 줄 모르고 코를 훌쩍이며 강가에 앉아 뭔가를 쓴다",
                                                                 english: "Unaware ink is dripping from my lips, I sit by the riverside and write something. I sob.",
                                                                 chinese: "不知不觉墨水从我的唇角滴落，我坐在河边写点什么。我抽泣。"),
                                                        Sentence(korean: "나는 내가 쓴 시 몇 줄에 묶였다",
                                                                 english: "I’m obsessed with the lines I write",
                                                                 chinese: "我痴迷于我写的诗词"),
                                                        Sentence(korean: "드디어 시에 결박되었다고 믿는 미치광이가 되었다",
                                                                 english: "I’m a madwoman who finally believes she is bound to poetry",
                                                                 chinese: "我是一个疯女人，她终于相信她注定要写诗")
                              ]),
                              
                              SentenceGroup(korean: "",
                                            english: "",
                                            chinese: ""),
                              SentenceGroup(korean: "눈앞에서 마귀가 바지를 내리고",
                                            english: "The devil appears. He pulls down his pants in front of my eyes.",
                                            chinese: "恶魔出现。他在我眼前脱下裤子。"),
                              SentenceGroup(korean: "빨면 시 한 줄을 주지",
                                            english: "I’ll give you a line if you give me a suck.",
                                            chinese: "如果你给我一个烂摊子，我会给你一条线。"),
                              SentenceGroup(korean: "악마라도 빨고 또 빨고, 계속해서 빨 심정이 된다",
                                            english: "Is he really the devil? Even if he is, I will suck and suck and suck and suck and suck.",
                                            chinese: "但他真的是恶魔吗？即使他是，我也会吸，吸，吸，吸，吸。"),
                              SentenceGroup(korean: "자다가 일어나 밖으로 나와 절박하지 않게 치욕적인 감정도 없이,",
                                            english: "I sleep and wake and walk outside. Without desperation, without shame,",
                                            chinese: "我睡觉，醒来，走到外面。没有绝望，没有羞耻，"),
                              SentenceGroup(korean: "커다란 펜을 문 채 나는 빤다 시가 쏟아질 때까지",
                                            english: "I bite a big pen and suck until poetry comes.",
                                            chinese: "我咬着一支大笔吸吮，直到诗歌出现。"),
                              SentenceGroup(korean: "나는 감정 갈보, 시인이라고 소개할 때면 창녀라고 자백하는 기분이다",
                                            english: "I’m an emotion slut. When I say I’m a poet I feel like I’m confessing I’m a whore.",
                                            chinese: "我是一个情感荡妇。当我说我是诗人我觉得我承认我是个妓女。"),
                              SentenceGroup(korean: "조상 중에 자신을 파는 사람은 없었다 ‘너처럼 나쁜 피가 없었다’고 아버지는 말씀하셨다",
                                            english: "No one in our family sold themselves, Father said, We never had blood like you.",
                                            chinese: "我们家没有人出卖自己，父亲说，我们从来没有像你这样的血。"),
                              SentenceGroup(korean: "펜을 불끈 쥔 채 부르르 떨었다",
                                            english: "I stroke my pen and shake violently",
                                            chinese: "我抚摸着笔，猛烈地摇晃着。"),
                              SentenceGroup(korean: "나는 지금 지방축제가 한창인 달밤에 늙은 천기(賤技)가 되어 양손에 칼을 들고 춤추는 것 같다",
                                            english: "I feel like an old filthy whore on a full-moon night when the country festival is booming.\nI’m dancing, a sword in each hand.",
                                            chinese: "在乡村节日蓬勃发展的月圆之夜，我感觉自己像个肮脏的老妓女。我在跳舞，双手各持一把剑。"),
                              
        ]
        
        self.sentenceGroups = sentenceGroups
    }
}
