<?php
namespace app\search\controller;
use think\Controller;
use think\File;
use app\search\model\Uploadimg as Img;
use app\search\model\Result;
use app\search\model\Check;
class Index extends Controller
{
	public function index()
{
	$list = Check::order("c_id DESC")->paginate(20);
	    $this->assign('list',$list);
return $this->fetch();
}
    public function edit($id)
{
	$this->assign('c_id', $id);
	$infoAll = array();
	$info = Result::where('c_id','=',$id)->order("e_id DESC")->select();
	for ($i = 0; $i < count($info); $i++)
{
array_push($infoAll, array("e_id"=>$info[$i]["e_id"],"desc"=>$info[$i]["desc"], "tip"=>$info[$i]["tip"],"pic"=>Img::where("e_id=".$info[$i]["e_id"])->select()));
}
  $this->assign('info', $infoAll);
return $this->fetch();
}
public function up($e_id,$id)
{
// 获取表单上传文件 例如上传了001.jpg
    $file = request()->file('image');
    // 移动到框架应用根目录/public/uploads/ 目录下
    $info = $file->validate(['size'=>1000000,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
    if($info){
        $data=new Img();
        $img_url=$info->getSaveName();
$data->img_url=$img_url;
$data->img_name=$info->getFilename();
$data->create_time=time();
$data->e_id=$e_id;
$result=$data->save();
if(!$result){
$this->error('上传失败！');
}else{
$this->redirect('edit?id='.$id);
}
    }else{
        // 上传失败获取错误信息
        echo $file->getError();
    }
}
public function del($e_id)
{
Img::where('e_id','=',$e_id)->delete();
Result::where('e_id','=',$e_id)->delete();
}
public function save($e_id)
{
	$input=input('post.');
	$r = Result::where('e_id','=',$e_id)->find();
	$id = $r['c_id'];
	$r['desc']=$input['desc'];
	$r['tip']=$input['tip'];
	$r->save();
	$this->redirect('edit?id='.$id);
//return true;
}
public function new_e($id)
{
	$result           = new Result;
	$result->c_id     = $id;
	$result->save();
	$this->redirect('edit?id='.$id);
}
public function new_c()
{
	$c_name = input('post.c_name');
  $check = new Check();
  $check->c_name = $c_name;
	$check->save();
	$this->redirect('index');
}
public function score($id)
{
$this->assign('c_id', $id);

return $this->fetch();
}

}
