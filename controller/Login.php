<?php
namespace app\search\controller;
use think\Controller;
use app\search\model\User;

class Login extends Controller
{
    // 用户登录表单
    public function index()
    {
        // 显示登录表单
        return $this->fetch();
    }
	// 处理用户提交的登录数据
    public function login()
    {
        // 直接调用M层方法，进行登录。
        if (User::login(input('post.username'), input('post.password')))
        {
            return $this->redirect('Index/index');
        } else {
            return $this->redirect('index');
        }
    }
	// 注销
    public function logOut()
    {
        if (User::logOut())
        {
            return $this->redirect('index');
        } else {
            return $this->error('logout error', url('index'));
        }
    }
} 