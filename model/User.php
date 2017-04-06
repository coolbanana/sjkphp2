<?php
namespace app\search\model;
use think\Model;

class User extends Model
{
	/**
     * 用户登录
     * @param  string $username 用户名
     * @param  string $password 密码
     * @return bool    成功返回true，失败返回false。
     */
    static public function login($username, $password)
    {
        // 验证用户是否存在
        if (null !== $user=self::getByUsername($username))
        {
            // 验证密码是否正确
            if ($user->checkPassword($password))
            {
                // 登录
                session('name', $user->getData('name'));
                session('uid', $user->getData('id'));
                return true;
            }
        }
        return false;

    }
	/**
     * 验证密码是否正确
     * @param  string $password 密码
     * @return bool
     */
    public function checkPassword($password)
    {
        if ($this->getData('password') === md5($password))
        {
            return true;
        } else {
            return false;
        }
    }
	/**
     * 注销
     * @return bool  成功true，失败false。
     * @author panjie
     */
    static public function logOut()
    {
        // 销毁session中数据
        session('name', null);
        return true;
    }
	/**
     * 判断用户是否已登录
     * @return boolean 已登录true
     */
    static public function isLogin()
    {
        $name = session('name');
        if (isset($name))
        {
            return true;
        } else {
            return false;
        }
    }
		static public function isAdmin()
    {
        $id = session('uid');
        $user=self::getById($id);
        if ($user->getData('permission')===1)
        {
            return true;
        } else {
            return false;
        }
    }

}
