
import Foundation
import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

@IBDesignable extension UILabel {

    @IBInspectable var borderWidth2: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius2: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor2: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

@IBDesignable extension UIView {

    @IBInspectable var borderWidth1: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius1: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor1: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

func roundCorner(button:UIButton)
{
    button.layer.cornerRadius = button.frame.size.height/2
    button.clipsToBounds = true
}

func roundCorneView(image:UIImageView)
{
    image.layer.cornerRadius = image.frame.size.height/2
    image.clipsToBounds = true
}
func roundCornerView(view:UIView)
{
    view.layer.cornerRadius = view.frame.size.height/2
    view.clipsToBounds = true
}
func roundCorneLabel(label:UILabel)
{
    label.layer.cornerRadius = label.frame.size.height/2
    label.clipsToBounds = true
}

struct Transaction: Codable,Equatable {
    var title: String
    var amount: String
    var type: String // "Income" or "Expense"
    var reason: String
    var dateTime: Date
    var budget:String
    
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
           return lhs.amount == rhs.amount &&
               lhs.type == rhs.type &&
                lhs.title == rhs.title &&
               lhs.reason == rhs.reason &&
               lhs.dateTime == rhs.dateTime &&
               lhs.budget == rhs.budget
       }
}

struct TransactionSection {
    let date: String
    var transactions: [Transaction]
}


var currency = ""

func formatAmount(_ amount: String) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    
    // Convert amount to a number
    if let number = formatter.number(from: amount) {
        return formatter.string(from: number) ?? amount
    } else {
        // If conversion fails, assume there's no dot and add two zeros after it
        let amountWithDot = amount + ".00"
        return formatter.string(from: formatter.number(from: amountWithDot)!) ?? amountWithDot
    }
}

struct Profiles: Codable{
    var name: String
    var date : Date
}

extension UIViewController
{
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}


let pagination1 = ["img1","img2","img3","img4","img5","img6","img7","img8","img9","img10"]

let beardcategory = ["Full Beard","Goatee Styles","Stubble","Short Beard Styles","Long Beard Styles","Fade Beards",
                   "Beard and Mustache Combinations"
               ]

let HaircutCategory = ["Classic Hair Styles","Modern Hair Styles","Curly Hair Styles","Straight Hair Styles","Short Hair Styles","Medium-Length Styles",
                   "Braided Hairs tyles","Updos and Buns","Baby Hair Style","Buzz Hair Style"
                  ]
let classichaircut = ["c1","c2","c3","c4","c5","c6",
                   "c7","c8","c9","c10","c11","c12","c13","c14","c15","c16","c17","c18","c19","c20","c21","c22","c23","c24","c25","c26","c27","c28","c29","c30","c31","c32","c33","c34","c35","c36","c37","c38","c39","c40","c41","c42","c43","c44","c45","c46","c47","c48","c49","c50"
                  ]
let hairimages = ["h1image","h2image","h3image","h4image","h5image","h6image",
                   "h7image","h8image","h9image","h10image"
                  ]
let modernhaircut = ["1","m2","m3","m4","m5","m6",
                   "m7","m8","m9","m10","m11","m12","m13","m14","m15","m16","m17","m18","m19","m20","m21","m22","m23","m24","m25","m26","m27","m28","m29","m30","m31","m32","m33","m34","m35","m36","m37","m38","m39","m40","m41","m42","m43","m44","m45","m46","m47","m48","m49","m50","m51","m52","m53","m54","m55","m56","m57","m58","m59","m60"
                  ]
let curlyhairstyle = ["cr1","cr2","cr3","cr4","cr5","cr6",
                   "cr7","cr8","cr9","cr10","cr11","cr12","cr13","cr14","cr15","cr16","cr17","cr18","cr19","cr20","cr21","cr22","cr23","cr24","cr25","cr26","cr27","cr28","cr29","cr30","cr31","cr32","cr33","cr34","cr35","cr36","cr37","cr38","cr39","cr40"
                  ]
let straighthairstyle = ["s1","s2","s3","s4","s5","s6",
                   "s7","s8","s9","s10","s11","s12","s13","s14","s15","s16","s17","s18","s19","s20","s21","s22","s23","s24","s25","s26","s27","s28","s29","s30","s31","s32","s33","s34","s35","s36","s37","s38","s39","s40"
                  ]
let shorthairstyle = ["sh1","sh2","sh3","sh4","sh5","sh6",
                   "sh7","sh8","sh9","sh10","sh11","sh12","sh13","sh14","sh15","sh16","sh17","sh18","sh19","sh20","sh21","sh22","sh23","sh24","sh25","sh26","sh27","sh28","sh29","sh30","sh31","sh32","sh33","sh34","sh35","sh36","sh37","sh38","sh39","sh40"
                  ]
let mediumlengthhairstyle = ["md1","md2","md3","md4","md5","md6",
                   "md7","md8","md9","md10","md11","md12","md13","md14","md15","md16","md17","md18","md19","md20","md21","md22","md23","md24","md25","md26","md27","md28","md29","md30","md31","md32","md33","md34","md35","md36","md37","md38","md39","md40"]

let braidedhairstyle = ["b1","b2","b3","b4","bb5","b6",
                   "b7","b8","b9","b10","b11","b12","b13","b14","b15","b16","b17","b18","b19","b20","b21","b22","b23","b24","b25","b26","b27","b28","b29","b30","b31","b32","b33","b34","b35","b36","b37","b38","b39","b40"]

let updowshairstyle = ["u1","u2","u3","u4","u5","u6",
                   "u7","u8","u9","u10","u11","u12","u13","u14","u15","u16","u17","u18","u19","u20","u21","u22","u23","u24","u25","u26","u27","u28","u29","u30","u31","u32","u33","u34","u35","u36","u37","u38","u39","u40"]

let babieshairstyle = ["ba1","ba2","ba3","ba4","ba5","ba6",
                   "ba7","ba8","ba9","ba10","ba11","ba12","ba13","ba14","ba15","ba16","ba17","ba18","ba19","ba20","ba21","ba22","ba23","ba24","ba25","ba26","ba27","ba28","ba29","ba30","ba31","ba32","ba33","ba34","ba35","ba36","ba37","ba38","ba39","ba40"]

let buzzhairstyle = ["bz1","bz2","bz3","bz4","bz5","bz6",
                   "bz7","bz8","bz9","bz10","bz11","bz12","bz13","bz14","bz15","bz16","bz17","bz18","bz19","bz20","bz21","bz22","bz23","bz24","bz25","bz26","bz27","bz28","bz29","bz30","bz31","bz32","bz33","bz34","bz35","bz36","bz37","bz38","bz39","bz40"]

let fullbeardtyle = ["f1","f2","f3","f4","f5","f6",
                   "f7","f8","f9","f10","f11","f12","f13","f14","f15","f16","f17","f18","f19","f20","f21","f22","f23","f24","f25","f26","f27","f28","f29","f30","f31","f32","f33","f34","f35","f36","f37","f38","f39","f40"]

let mustachetyle = ["ms1","ms2","ms3","ms4","ms5","ms6",
                   "ms7","ms8","ms9","ms10","ms11","ms12","ms13","ms14","ms15","ms16","ms17","ms18","ms19","ms20","ms21","ms22","ms23","ms24","ms25","ms26","ms27","ms28","ms29","ms30","ms31","ms32","ms33","ms34","ms35","ms36","ms37","ms38","ms39","ms40"]
let historicalstyle = ["h1","h2","h3","h4","h5","h6",
                   "h7","h8","h9","h10","h11","h12","h13","h14","h15","h16","h17","h18","h19","h20","h21","h22","h23","h24","h25","h26","h27","h28","h29","h30","h31","h32","h33","h34","h35","h36","h37","h38","h39","h40"]
let trendingstyle = ["t1","t2","t3","t4","t5","t6",
                   "t7","t8","t9","t10","t11","t12","t13","t14","t15","t16","t17","t18","t19","t20","t21","t22","t23","t24","t25","t26","t27","t28","t29","t30","t31","t32","t33","t34","t35","t36","t37","t38","t39","t40"]
let fadehairstyle = ["fd1","fd2","fd3","fd4","fd5","fd6",
                   "fd7","fd8","fd9","fd10","fd11","fd12","fd13","fd14","fd15","fd16","fd17","fd18","fd19","fd20","fd21","fd22","fd23","fd24","fd25","fd26","fd27","fd28","fd29","fd30","fd31","fd32","fd33","fd34","fd35","fd36","fd37","fd38","fd39","fd40","fd41","fd42","fd43","fd44","fd45","fd46"]
