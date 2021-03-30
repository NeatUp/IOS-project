/*
 
 */

import SwiftUI

struct ActivitiesRow: View {
    var activity: Activity
    @Namespace var namespace
    
    var body: some View {
        Group{
            smallcardView(p:activity, namespace: namespace)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 90)
                .background(BlurView(style: .regular))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.vertical, 6)
        }
    }
}

struct ActivitesRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActivitiesRow(activity: activities[0])
                .preferredColorScheme(.light)
            ActivitiesRow(activity: activities[1])
        }
        .previewLayout(.fixed(width: 400, height: 130))
    }
}


struct smallcardView: View {
    
    var p: Activity
    let namespace: Namespace.ID
    let tagsArray : [String]
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
    
    //var tagsArray = [String]();
    //tagsArray.append(p.fields.type);
    init(p:Activity, namespace: Namespace.ID) {
        self.p = p;
        self.namespace = namespace;
        self.tagsArray = [p.fields.type]
        //tagsArray.append(p.fields.type)
    }
    
    var body: some View {
        
        GeometryReader { g in
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        blurTags(tags: tagsArray, namespace: namespace)
                        //Spacer()
                        Text(p.fields.name)
                            .foregroundColor(Color.white)
                            .matchedGeometryEffect(id: "title", in: namespace)
                        Spacer()
                        HStack {
                            
                            Text("\(p.fields.startDate, formatter: Self.taskDateFormat) - \(p.fields.endDate, formatter: Self.taskDateFormat)")
                                .font(.subheadline)
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                    }.padding(.leading)
                    Spacer()
                }
            }
        }
    }
}

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {
        
    }
}

struct blurTags:  View {
    
    var tags: Array<String>
    let namespace: Namespace.ID
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                Text("\(tag)")
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .font(.caption)
                
            }
        }.matchedGeometryEffect(id: "tags", in: namespace)
    }
}
