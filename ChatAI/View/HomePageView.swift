//
//  HomePageView.swift
//  ChatAI
//
//  Created by Aniyah Norman on 3/16/23.
//

import SwiftUI
struct HomePageView: View {
    
    @Binding var currentView: Int
    @State private var isArticleOpen = false
    @State private var isArticle2Open = false
    @State private var isArticle3Open = false
    @State private var isArticle4Open = false
    var body: some View {
        ZStack {
            Image("signup_background")
                .resizable()
                .offset(y: 400)
            Image("signup_background")
                .resizable()
                .offset(y: -400)
            ScrollView {
                VStack(spacing: 30) {
                    Spacer()
                    Button(action: {
                        isArticleOpen = true
                    }) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("dairyBlue"))
                            .frame(width: 300, height: 160)
                            .overlay {
                                Text("Dos and Donts of AI Marketing")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                        }
                            .popover(isPresented: $isArticleOpen, arrowEdge: .top) {
                                ScrollView {
                                    VStack(alignment: .center) {
                                        Text("Dos and Donts of AI Marketing")
                                            .font(.title)
                                            .foregroundColor(.black)
                                            .padding(10)
                                            .bold()
                                        Image("dos-donts")
                                            .resizable()
                                            .frame(width: 350, height: 220)
                                        Text("In today's digital era, artificial intelligence (AI) has revolutionized various aspects of marketing, including content creation, customer segmentation, and personalized messaging. AI-generated marketing offers immense potential for efficiency, scalability, and enhanced customer experiences. However, like any powerful tool, it requires careful consideration and responsible implementation. To help businesses navigate the realm of AI-generated marketing, we present the dos and don'ts for harnessing its capabilities effectively.").font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text("Do:")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .bold()
                                            .padding(10)
                                        Text("Do use AI to personalize the marketing message:")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text("AI can analyze data to personalize marketing messages for each individual customer. This can help improve engagement and increase conversion rates.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("Don't:")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .bold()
                                            .padding(10)
                                        Text("Don't rely solely on AI-generated content:")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("AI can help automate certain aspects of marketing, but it's important to balance it with human creativity and intuition. Too much reliance on AI-generated content can lead to generic and impersonal messaging that fails to connect with customers.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                    }
                                    .padding()
                                
                                }
                                            }
                    }
                    Button(action: {
                        isArticle2Open = true
                    }) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("dairyGold"))
                            .frame(width: 300, height: 160)
                            .overlay {
                                Text("Branding 101")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                        }
                            .popover(isPresented: $isArticle2Open, arrowEdge: .top) {
                                ScrollView {
                                    VStack(alignment: .center) {
                                        Text("Brandind 101: Building a Strong Brand Identity")
                                            .font(.title)
                                            .foregroundColor(.black)
                                            .padding(10)
                                            .bold()
                                        Image("branding")
                                            .resizable()
                                            .frame(width: 350, height: 220)
                                        Text("Branding is the process of creating a unique and memorable identity for your company or product. A strong brand identity can help differentiate your business from competitors, build trust with customers, and drive sales. Here are some key steps to building a strong brand identity:").font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text("1. Define Your Brand: The first step in building a strong brand identity is to define what your brand represents. What are your core values, mission, and vision? What sets your company apart from others in your industry? Once you have a clear understanding of your brand, you can start to develop messaging and visuals that communicate your brand to the world.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("2. Know Your Target Audience: Understanding your target audience is essential to creating a brand that resonates with customers. Who are your ideal customers? What are their needs, desires, and pain points? By understanding your target audience, you can create messaging and visuals that speak directly to their interests and motivations.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text("3. Develop Your Brand Voice: Your brand voice is the tone and style of your messaging. Is your brand voice serious and professional, or playful and fun? Whatever tone you choose, it should be consistent across all of your marketing channels to create a cohesive brand identity.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("4. Design Your Visual Identity: Your visual identity includes your logo, color scheme, typography, and other visual elements that represent your brand. Your visual identity should be consistent across all of your marketing channels to create a recognizable and memorable brand.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("5. Create Brand Guidelines: Once you have developed your brand identity, it's important to create brand guidelines that outline how your brand should be represented in all marketing materials. This includes guidelines for your logo, color scheme, typography, and messaging. By creating brand guidelines, you can ensure that your brand is consistently represented across all marketing channels.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("Building a strong brand identity takes time and effort, but the payoff can be significant. By creating a brand that resonates with customers, you can build trust, increase loyalty, and drive sales for your business.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                    }
                                    .padding()
                                
                                }
                                            }
                    }
                    Button(action: {
                        isArticle3Open = true
                    }) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("dairyBlue"))
                            .frame(width: 300, height: 160)
                            .overlay {
                                Text("Captivating Taglines")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                            }
                            .popover(isPresented: $isArticle3Open, arrowEdge: .top) {
                                ScrollView {
                                    VStack(alignment: .center) {
                                        Text("How to Write Captivating Taglines")
                                            .font(.title)
                                            .foregroundColor(.black)
                                            .padding(10)
                                            .bold()
                                        Image("tagline")
                                            .resizable()
                                            .frame(width: 350, height: 220)
                                        Text("A tagline is a short phrase or slogan that captures the essence of your brand or product. A good tagline should be memorable, catchy, and convey a unique selling proposition. Here are some tips for writing captivating taglines:").font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text("1. Keep it Short and Simple: A good tagline should be short and easy to remember. Ideally, it should be no more than 7-10 words. Keep your language simple and avoid using jargon or complex terminology that may confuse or alienate your audience.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text("2. Highlight Your Unique Selling Proposition: Your tagline should convey what makes your brand or product unique. What sets you apart from your competitors? What benefit or value do you provide to your customers? By highlighting your unique selling proposition, you can create a tagline that resonates with your audience and differentiates your brand.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("3. Use Strong Verbs and Adjectives: Strong verbs and adjectives can help make your tagline more memorable and impactful. Use action words that convey a sense of energy, excitement, or urgency. Use adjectives that evoke emotions or paint a picture in the reader's mind.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("4. Make it Catchy and Memorable: A good tagline should be catchy and easy to remember. Use wordplay, puns, or rhymes to make your tagline more memorable. Consider using repetition or alliteration to create a rhythm that sticks in the reader's mind.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("5. Test and Refine: Once you have developed your tagline, test it with your target audience to see how they respond. Ask for feedback on whether the tagline accurately conveys your brand or product, and whether it is memorable or impactful. Use this feedback to refine your tagline until you have a compelling and captivating slogan that resonates with your audience.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("In summary, a good tagline should be short, simple, and memorable, while highlighting your unique selling proposition and using strong verbs and adjectives to create a catchy and impactful message. By following these tips, you can write a tagline that captures the essence of your brand and resonates with your audience.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                    }
                                    .padding()
                                    
                                }
                            }
                    }
                    Button(action: {
                        isArticle4Open = true
                    }) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("dairyGold"))
                            .frame(width: 300, height: 160)
                            .overlay {
                                Text("Audience Rentation Strategy")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                            }
                            .popover(isPresented: $isArticle4Open, arrowEdge: .top) {
                                ScrollView {
                                    VStack(alignment: .center) {
                                        Text("How to Retain an Audience Through Marketing")
                                            .font(.title)
                                            .foregroundColor(.black)
                                            .padding(10)
                                            .bold()
                                        Image("audienceren")
                                            .resizable()
                                            .frame(width: 350, height: 200)
                                        Text("Retaining an audience is just as important as attracting a new one. By keeping your existing customers engaged, you can build loyalty and increase sales. Here are some tips for retaining an audience through marketing:").font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text("1. Personalize Your Messaging: Personalization is key to retaining an audience. Use data and analytics to understand your customers' needs and interests, and tailor your messaging accordingly. By providing personalized content and offers, you can show your customers that you value their business and understand their unique preferences.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text("2. Provide Value: Your marketing should provide value to your customers beyond just promoting your products or services. Provide educational content, helpful tips, and other resources that your audience will find useful and engaging. By providing value, you can build trust and establish your brand as a thought leader in your industry.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("3. Stay Active on Social Media: Social media is a powerful tool for retaining an audience. By staying active on social media and engaging with your followers, you can build a community around your brand and create a sense of belonging for your customers. Use social media to provide customer support, share behind-the-scenes content, and foster conversations around topics that are relevant to your audience.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("4. Offer Loyalty Programs and Rewards: Loyalty programs and rewards can incentivize customers to stay engaged with your brand. Offer discounts, exclusive content, and other rewards to customers who have been with your brand for a long time or who make frequent purchases. By rewarding loyalty, you can show your customers that you value their business and appreciate their support")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("5. Keep Your Brand Fresh: Finally, it's important to keep your brand fresh and relevant. Regularly update your marketing messaging, visuals, and other elements to reflect changes in your industry or your customers' needs. By staying current and adapting to changing trends, you can retain your audience and continue to grow your business.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                        Text("In summary, retaining an audience through marketing requires personalization, value, social media engagement, loyalty programs, and a commitment to keeping your brand fresh. By following these tips, you can keep your existing customers engaged and build a loyal following for your brand.")
                                            .font(.body)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                            .padding(10)
                                    }
                                    .padding()
                                    
                                }
                            }
                    }
                    Spacer()
                }
                .frame(width: 350)
            }
        }
    }
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(currentView: .constant(1))
    }
}

