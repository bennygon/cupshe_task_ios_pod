//
//  TaskSDK.swift
//  TaskSDK
//
//  Created by gbl on 2023/10/23.
//

import Foundation
import UIKit

@objcMembers
public class TaskSDK : NSObject {
    
//    public static let instance = TaskSDK()
    
    private var token: String = ""
    private var brand: String = ""
    private var channel: String = ""
    private var site: String = ""
    private var terminal: String = ""
    private var lang: String = ""
    private var activityId: String = ""
    private var uiContextHanlder: UIViewController?
    private var env:TaskEnvironment = TaskEnvironment.TEST
    
    private var countDownView : CountdownView?
    private var taskListView : TaskListView?
//    private var taskShareView : TaskShareView?
    
    private var taskVm: TaskVM = TaskVM()
    
    private var userTaskId:Int = 0
    
    public init(token:String,brand:String,channel:String,site:String,terminal:String,lang:String,activityId:String,uiContextHanlder: UIViewController){
        super.init()
        self.token = token
        self.brand = brand
        self.channel = channel
        self.site = site
        self.terminal = terminal
        self.lang = lang
        self.uiContextHanlder = uiContextHanlder
        self.activityId = activityId
    }
    
    public init(token:String,brand:String,channel:String,site:String,terminal:String,lang:String,activityId:String){
        super.init()
        self.token = token
        self.brand = brand
        self.channel = channel
        self.site = site
        self.terminal = terminal
        self.lang = lang
        self.activityId = activityId
    }
    
    
    
    public func setToken(token:String){
        self.token = token
    }
    
    public func setBrand(brand:String){
        self.brand = brand
    }
    
    public func setChannel(channel:String){
        self.channel = channel
    }
    
    public func setSite(site:String){
        self.site = site
    }
    
    public func setTerminal(terminal:String){
        self.terminal = terminal
    }
    
    public func setLang(lang:String){
        self.lang = lang
    }
    
    public func setActivityId(activityId:String){
        self.activityId = activityId
    }
    
    public func setUiContextHanlder(uiContextHanlder: UIViewController){
        self.uiContextHanlder = uiContextHanlder
    }
    
    public func setTaskEnvironment(env : TaskEnvironment){
        self.env = env
    }
    
    public func setAa(env : TaskEnvironment){
        self.env = env
    }

    
//    public func startPageView(pageName:String){
//
//        if self.uiContextHanlder != nil {
////            taskVm.checkPageBrowseView(userId: Int, brand: <#T##Int#>, channel: <#T##Int#>, site: <#T##Int#>, terminal: <#T##Int#>, lang: <#T##String#>, callback: T##([TaskInfo]?) -> Void)
//
//
//
//            self.countDownView = CountdownView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//            self.countDownView!.showView(uiViewController: self.uiContextHanlder!, lang: self.lang)
//        }
//
////        showCountdownView();
//    }

    public func stopPageView(){
        if self.countDownView != nil {
            self.countDownView!.dismissCountdownView()
            self.countDownView = nil
        }
        
        if self.taskListView != nil {
            self.taskListView!.dismissTaskList()
            self.taskListView = nil
        }
//        closeCountdownView();
    }
    
    public func showTaskList(){
        if self.uiContextHanlder != nil {
            //得到当前用户所有的任务
            
            let query: TaskListParam = TaskListParam()
            
            query.token = self.token
            
            if !self.brand.isEmpty {
                query.brandId = self.brand
            }
            if !self.channel.isEmpty {
                query.channelId = self.channel
            }
            if !self.site.isEmpty {
                query.siteId = self.site
            }
            if !self.terminal.isEmpty {
                query.terminalId = self.terminal
            }
            if !self.lang.isEmpty {
                query.appLangCode = self.lang
            }
            
            if !self.activityId.isEmpty {
                query.activityId = self.activityId
            }
            
//        brand: self.brand, channel: self.channel, site: self.site, terminal: self.terminal, lang: self.lang
            
            taskVm.getTaksList(env:self.env,token: self.token, params: query) { taskList in

                
                if taskList != nil && taskList!.count > 0 {
//                    print(taskList)
//                    if self.taskListView == nil {
                        self.taskListView = TaskListView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
                        
                    self.taskListView!.initView(uiViewController: self.uiContextHanlder!, brand: self.brand, channel: self.channel, site: self.site, terminal: self.terminal, token: self.token,lang: self.lang,activityId:self.activityId,env: self.env)
//                    }
                    
                    self.taskListView!.setListData(taskList: taskList!)
                    self.taskListView!.showView()
                }
                
            }
        }

    }

    public func closeTaskList(){
        
//        closeCountdownView();
        if self.taskListView != nil {
            self.taskListView?.dismissTaskList()
        }
    }
    
//    public func showShareView(){
//        if self.uiContextHanlder != nil {
//            //得到当前用户所有的任务
////            taskVm.getTaksList(userId: self.userId, brand: self.brand, channel: self.channel, site: self.site, terminal: self.terminal, lang: self.lang) { taskList in
////
////                if taskList != nil && taskList!.count > 0 {
//                    if self.taskShareView == nil {
//                        self.taskShareView = TaskShareView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//
//                        self.taskShareView!.initView(uiViewController: self.uiContextHanlder!, brand: self.brand, channel: self.channel, site: self.site, terminal: self.terminal, token: self.token,lang: self.lang)
//                    }
//
////                    self.taskListView!.setListData(taskList: taskList!)
//
//                    self.taskShareView!.showView()
////                }
////
////            }
//        }
//
//    }
//
//
//    public func closeShareView(){
//
////        closeCountdownView();
//        if self.taskShareView != nil {
//            self.taskShareView?.dismissTaskShare()
//        }
//    }
    
    
    public func startPageView(taskId:Int){
        if self.uiContextHanlder != nil {
            let query: TaskPageViewParam = TaskPageViewParam()
            query.token = self.token
            if !self.brand.isEmpty{
                query.brandId = self.brand
            }
            if !self.channel.isEmpty{
                query.channelId = self.channel
            }
            if !self.site.isEmpty {
                query.siteId = self.site
            }
            if !self.terminal.isEmpty {
                query.terminalId = self.terminal
            }

            if !self.lang.isEmpty {
                query.appLangCode = self.lang
            }
            if taskId != nil && taskId > 0 {
                query.taskId  = taskId
            }
            taskVm.startPageViewTask(env:self.env,token: self.token, params: query) { info in
                if info != nil {
                    //开始浏览任务
                        
                    self.countDownView = CountdownView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
                    self.countDownView!.showView(uiViewController: self.uiContextHanlder!,token: self.token,brand: self.brand, channel: self.channel, site: self.site, terminal: self.terminal,lang: self.lang,data:info!,env: self.env)
                    
                    
                    //        showCountdownView();
                }
            }
        }
    }
    
    
}
