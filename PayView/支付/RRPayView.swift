//
//  RRPayView.swift
//  RRSTCOURIER
//
//  Created by mac on 2018/12/17.
//  Copyright © 2018 YANGGQ. All rights reserved.
//

import UIKit
//
let KSCREEN_WIDTH:  CGFloat = UIScreen.main.bounds.width
let KSCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
let IPhoneX:Bool = KSCREEN_HEIGHT == 812 ? true : false
let KNAV_HEIGHT:CGFloat = IPhoneX ? 88.0 : 64.0
let KToBottomHeight:CGFloat = IPhoneX ? 34.0 : 0.0
//
class RRPayView: UIView {
    var buttonbg:UIButton!
    var tableView:UITableView!
    var viewbg:UIView!
    var rowheight:Int = 46
    var buttonCommit:UIButton!
    var currentRow = 0
    let dataSource = ["余额支付","微信支付","支付宝支付"]
    let dataSourceimg = ["ic_pay_1","账户充值_03","账户充值_10"]

    lazy var heightbg:CGFloat = { () -> CGFloat in
        let hei = self.dataSource.count * self.rowheight + 90
        return CGFloat(hei)
    }()
    typealias RRPayViewClosure = (Int)->Void
    
    var closure :RRPayViewClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension RRPayView:UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.rowheight)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:RRPayCell = tableView.dequeueReusableCell(withIdentifier: "RRPayCell", for: indexPath) as! RRPayCell
        cell.selectionStyle = .none
        cell.lablename.text = self.dataSource[indexPath.row]
        cell.imagepic.image = UIImage(named: self.dataSourceimg[indexPath.row])
        cell.imagechcek.image = UIImage(named: (indexPath.row == self.currentRow ? "check_2":"check_1"))
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentRow = indexPath.row
        self.tableView.reloadData()
    }
    func setUpView() {
        buttonbg = UIButton.init(frame: self.bounds).then({ make in
            self.addSubview(make)
            make.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0)
            make.addTarget(self, action: #selector(self.buttonclick), for: .touchUpInside)
        })
        
        viewbg = UIView().then({ make in
            self.addSubview(make)
            make.backgroundColor = UIColor.white
//            _ = make.sd_layout()?.leftSpaceToView(self,0)?.rightSpaceToView(self,0)?.bottomSpaceToView(self,0)?.heightIs(self.heightbg)
            make.frame = CGRect(x: 0, y: KSCREEN_HEIGHT - self.heightbg, width: KSCREEN_WIDTH, height: self.heightbg)
        })
        tableView = UITableView.init(frame: CGRect(x:0 ,y: KNAV_HEIGHT,width: KSCREEN_WIDTH,height:CGFloat( self.rowheight * self.dataSource.count)), style: .plain).then({
            $0.separatorColor = UIColor.init(red: 242.0/255.0, green: 243.0/255.0, blue: 248.0/255.0, alpha: 1)
            if #available(iOS 11.0, *) {
                $0.contentInsetAdjustmentBehavior = .never
            }
            $0.delegate = self
            $0.dataSource = self
            $0.bounces = false
            $0.register(UINib(nibName: "RRPayCell", bundle: nil), forCellReuseIdentifier: "RRPayCell")
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            viewbg.addSubview($0)
//            _ = $0.sd_layout().topSpaceToView(viewbg,0)?.rightSpaceToView(viewbg,0)?.leftSpaceToView(viewbg,0)?.heightIs(CGFloat( self.rowheight * self.dataSource.count))
            $0.frame = CGRect(x: 0, y: 0, width: Int(KSCREEN_WIDTH), height: self.rowheight * self.dataSource.count)
        })
        buttonCommit = UIButton().then({ make in
            viewbg.addSubview(make)
//            _ = make.sd_layout()?.centerXEqualToView(viewbg)?.topSpaceToView(tableView,16)?.widthIs(160)?.heightIs(40)
//            make.sd_cornerRadiusFromHeightRatio = 0.5
            make.frame = CGRect(x: Int((KSCREEN_WIDTH - 160) / 2), y: self.rowheight * self.dataSource.count + 16, width: 160, height: 40)
            make.layer.cornerRadius = 20
            make.layer.masksToBounds = true
            make.setTitle("确认支付", for: .normal)
            make.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            make.backgroundColor = UIColor.init(red: 255/255.0, green: 81/255.0, blue: 4/255.0, alpha: 1)
            make.addTarget(self, action: #selector(self.buttonclick), for: .touchUpInside)
        })
        
        self.viewbg.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: self.heightbg)
        UIView.animate(withDuration: 0.3) {
            self.viewbg.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - self.heightbg, width: UIScreen.main.bounds.width, height: self.heightbg)
            self.buttonbg.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.3)
        }
    }
    @objc  func buttonclick(){
        self.didMiss()
    }
    func didMiss(){
        if self.closure != nil{
            self.closure!(self.currentRow)
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.buttonbg.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0)
            self.viewbg.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: self.heightbg)
        }) { (Bool) in
            self.buttonbg.removeFromSuperview()
            self.viewbg.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
}
