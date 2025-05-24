#!/bin/bash

# 设置用户信息（如已设置可注释或删除这两行）
git config --global user.email "lyx220356@mail.ustc.edu.cn"
git config --global user.name "jaxlyx"

if ! git remote | grep -q '^cneuro-blog$'; then
  echo "添加远程仓库 cneuro-blog"
  git remote add cneuro-blog https://github.com/jaxlyx/cneuro-blog.git
fi


echo "检查 git 状态..."
git status

git add .

if git diff --cached --quiet; then
  echo "没有变更，跳过提交与推送。"
  exit 0
fi

COMMIT_MSG="更新了博客内容 $(date +'%Y-%m-%d %H:%M:%S')"
echo "提交信息：$COMMIT_MSG"

git commit -m "$COMMIT_MSG"

echo "强制推送到远程 cneuro-blog main 分支..."
git push cneuro-blog main --force

echo "推送完成！"
