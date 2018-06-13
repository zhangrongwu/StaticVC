
#!/bin/bash
#该脚本仅适用于cocoapods生成的framework静态库
frameworkName='StaticVC'
#修改
oldversion='1.0.0.1'
#修改
version='1.0.0.2'
message='${version}版本测试pod发布'

cd Example
pod install
cd ..
#本地校验
pod lib lint ${frameworkName}.podspec  --no-clean --verbose --allow-warnings
#代码提交到服务器
git add .
git commit -a -m${version}${message}
git tag -a $version -m${message}
git push origin ${version}
git push -u origin master 
#修改version
sed -i '' "s/${oldversion}/${version}/g" ${frameworkName}.podspec




#公有库校验
###################################公有库#######################################
pod spec lint --no-clean --allow-warnings --verbose
#发布到cocoapods库
pod trunk push ${frameworkName}.podspec --allow-warnings

