#!/usr/bin/env python
# encoding: utf-8
# author: Think
# created: 2018/12/7 13:56

"""
  发送邮件
"""

import smtplib
from email.mime.text import MIMEText
from email.header import Header
from email.utils import formataddr


def sendMail(**kwargs):
    host = kwargs.get('host', None)
    username = kwargs.get('username', None)
    password = kwargs.get('password', None)
    sender = kwargs.get('sender', None)
    receivers = kwargs.get('receivers', None)
    text = kwargs.get('text', None)
    html = kwargs.get('html', None)
    subject = kwargs.get('subject', None)
    from_ = kwargs.get('from', None)

    message = MIMEText(_text=html if html is not None else text, _subtype='html' if html is not None else 'plain',
                       _charset='utf-8')
    message['From'] = formataddr((from_, sender))
    message['To'] = ';'.join(receivers)
    message['Subject'] = Header(subject, 'utf-8')

    smtpObj = smtplib.SMTP(host)
    smtpObj.starttls()
    smtpObj.login(username, password)
    smtpObj.sendmail(sender, receivers, message.as_string())
