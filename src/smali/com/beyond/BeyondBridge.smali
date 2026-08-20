.class public Lcom/beyond/BeyondBridge;
.super Ljava/lang/Object;
.source "BeyondBridge.java"


# static fields
.field private static HD_KEYPAD_HIDDEN:I

.field private static KEYPAD:I

.field public static NET_TYPE_MOBILE:I

.field public static NET_TYPE_NONE:I

.field public static NET_TYPE_WIFI:I

.field static build_mode:I

.field static carrier_socket:Lorg/kwis/msf/io/Socket;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 23
    sput v1, Lcom/beyond/BeyondBridge;->NET_TYPE_NONE:I

    .line 24
    const/4 v0, 0x1

    sput v0, Lcom/beyond/BeyondBridge;->NET_TYPE_WIFI:I

    .line 25
    const/4 v0, 0x2

    sput v0, Lcom/beyond/BeyondBridge;->NET_TYPE_MOBILE:I

    .line 28
    sput v1, Lcom/beyond/BeyondBridge;->KEYPAD:I

    .line 34
    sput v1, Lcom/beyond/BeyondBridge;->HD_KEYPAD_HIDDEN:I

    .line 40
    const/4 v0, 0x0

    sput-object v0, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    .line 41
    const/4 v0, -0x1

    sput v0, Lcom/beyond/BeyondBridge;->build_mode:I

    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buyItem(Ljava/lang/String;)I
    .locals 1
    .param p0, "itemId"    # Ljava/lang/String;

    .prologue
    .line 274
    const/4 v0, 0x0

    return v0
.end method

.method public static checkAbleBuy(Ljava/lang/String;)Z
    .locals 1
    .param p0, "itemId"    # Ljava/lang/String;

    .prologue
    .line 270
    const/4 v0, 0x0

    return v0
.end method

.method public static getActiveNetType()I
    .locals 4

    .prologue
    .line 219
    sget-object v2, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    const-string v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 220
    .local v1, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 221
    .local v0, "an":Landroid/net/NetworkInfo;
    if-nez v0, :cond_0

    .line 222
    sget v2, Lcom/beyond/BeyondBridge;->NET_TYPE_NONE:I

    .line 229
    :goto_0
    return v2

    .line 223
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 224
    sget v2, Lcom/beyond/BeyondBridge;->NET_TYPE_WIFI:I

    goto :goto_0

    .line 226
    :cond_1
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    if-nez v2, :cond_2

    .line 227
    sget v2, Lcom/beyond/BeyondBridge;->NET_TYPE_MOBILE:I

    goto :goto_0

    .line 229
    :cond_2
    const/4 v2, -0x1

    goto :goto_0
.end method

.method private static getMainClass()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v3, 0x0

    .line 238
    const/4 v5, 0x0

    .line 241
    .local v5, "str":Ljava/lang/String;
    :try_start_0
    const-string v8, "resource:/appinfo.des"

    invoke-static {v8}, Lorg/kwis/msf/io/URL;->find(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v8

    invoke-interface {v8}, Lorg/kwis/msf/io/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 243
    .local v2, "is":Ljava/io/InputStream;
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v8

    new-array v0, v8, [B

    .line 244
    .local v0, "barr":[B
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    .line 245
    new-instance v6, Ljava/lang/String;

    const/4 v8, 0x0

    array-length v9, v0

    invoke-direct {v6, v0, v8, v9}, Ljava/lang/String;-><init>([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v5    # "str":Ljava/lang/String;
    .local v6, "str":Ljava/lang/String;
    move-object v5, v6

    .line 249
    .end local v0    # "barr":[B
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v6    # "str":Ljava/lang/String;
    .restart local v5    # "str":Ljava/lang/String;
    :goto_0
    if-nez v5, :cond_1

    .line 266
    :cond_0
    :goto_1
    return-object v3

    .line 252
    :cond_1
    new-instance v4, Lcom/beyond/util/SimpleTokenizer;

    const/16 v8, 0xa

    invoke-direct {v4, v5, v8}, Lcom/beyond/util/SimpleTokenizer;-><init>(Ljava/lang/String;C)V

    .line 255
    .local v4, "st":Lcom/beyond/util/SimpleTokenizer;
    const-string v1, "main_class:"

    .line 257
    .local v1, "config":Ljava/lang/String;
    :cond_2
    invoke-virtual {v4}, Lcom/beyond/util/SimpleTokenizer;->next()Ljava/lang/String;

    move-result-object v7

    .line 258
    .local v7, "strTmp":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 260
    invoke-virtual {v7, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 261
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v8, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 262
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 263
    .local v3, "main_class":Ljava/lang/String;
    goto :goto_1

    .line 247
    .end local v1    # "config":Ljava/lang/String;
    .end local v3    # "main_class":Ljava/lang/String;
    .end local v4    # "st":Lcom/beyond/util/SimpleTokenizer;
    .end local v7    # "strTmp":Ljava/lang/String;
    :catch_0
    move-exception v8

    goto :goto_0
.end method

.method public static getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "command"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    const/4 v9, 0x0

    .line 44
    sget-object v8, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    if-eqz v8, :cond_2

    .line 45
    new-instance v4, Lorg/kwis/msf/io/Message;

    invoke-direct {v4, p0, v0, v9, v9}, Lorg/kwis/msf/io/Message;-><init>(Ljava/lang/String;[BII)V

    .line 47
    .local v4, "m":Lorg/kwis/msf/io/Message;
    :try_start_0
    sget-object v8, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    invoke-interface {v8, v4}, Lorg/kwis/msf/io/Socket;->recv(Lorg/kwis/msf/io/Message;)V

    .line 48
    invoke-virtual {v4}, Lorg/kwis/msf/io/Message;->getAddressInt()I

    move-result v6

    .line 49
    .local v6, "ret_i":I
    const/4 v8, -0x1

    if-eq v6, v8, :cond_1

    .line 50
    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    .line 145
    .end local v4    # "m":Lorg/kwis/msf/io/Message;
    .end local v6    # "ret_i":I
    :cond_0
    :goto_0
    return-object v5

    .line 52
    .restart local v4    # "m":Lorg/kwis/msf/io/Message;
    .restart local v6    # "ret_i":I
    :cond_1
    invoke-virtual {v4}, Lorg/kwis/msf/io/Message;->getAddress()Ljava/lang/String;

    move-result-object v5

    .line 53
    .local v5, "ret":Ljava/lang/String;
    if-eqz v5, :cond_2

    .line 54
    const-string v8, "PHONENUMBER"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 55
    invoke-static {v5}, Lcom/beyond/BeyondBridge;->reformPhoneNumber(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_0

    .line 59
    .end local v5    # "ret":Ljava/lang/String;
    .end local v6    # "ret_i":I
    :catch_0
    move-exception v8

    .line 63
    .end local v4    # "m":Lorg/kwis/msf/io/Message;
    :cond_2
    const-string v8, "carrier"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 65
    :try_start_1
    const-string v8, "carrier:"

    invoke-static {v8}, Lorg/kwis/msf/io/URL;->find(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;

    move-result-object v8

    sput-object v8, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    .line 66
    sget-object v8, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    invoke-interface {v8}, Lorg/kwis/msf/io/Socket;->getPeerAddress()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .local v0, "c":Ljava/lang/String;
    move-object v5, v0

    .line 67
    goto :goto_0

    .line 69
    .end local v0    # "c":Ljava/lang/String;
    :catch_1
    move-exception v8

    .line 72
    const-string v5, "BEYOND"

    goto :goto_0

    .line 74
    :cond_3
    const-string v8, "license"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 76
    :try_start_2
    const-string v8, "com.beyond.license.LicenseChecker"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v1

    .line 78
    .local v1, "justclass":Ljava/lang/Class;
    if-eqz v1, :cond_4

    .line 79
    const-string v5, "YES"

    goto :goto_0

    .line 81
    .end local v1    # "justclass":Ljava/lang/Class;
    :catch_2
    move-exception v8

    .line 84
    :cond_4
    const-string v5, "NO"

    goto :goto_0

    .line 86
    :cond_5
    const-string v8, "VOLUMELEVEL"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 87
    invoke-static {}, Lcom/beyond/MediaBridge;->volume_get()I

    move-result v5

    .line 88
    .local v5, "ret":I
    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 90
    .end local v5    # "ret":I
    :cond_6
    const-string v8, "SUPPORT_VIBRATION"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 91
    const-string v5, "yes"

    goto :goto_0

    .line 93
    :cond_7
    const-string v8, "VIBRATORLEVEL"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 94
    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 96
    :cond_8
    const-string v8, "MEDIADEVICES"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 97
    invoke-static {}, Lcom/beyond/MediaBridge;->getAvailableDevices()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 99
    :cond_9
    const-string v8, "SUPPORT_SENSOR"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 100
    const-string v5, "yes"

    goto/16 :goto_0

    .line 102
    :cond_a
    const-string v8, "PHONEMODEL"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 106
    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    goto/16 :goto_0

    .line 108
    :cond_b
    const-string v8, "OSType"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    .line 109
    const-string v5, "Android"

    goto/16 :goto_0

    .line 111
    :cond_c
    const-string v8, "PHONENUMBER"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    .line 112
    sget-object v8, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    const-string v9, "phone"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/telephony/TelephonyManager;

    .line 113
    .local v7, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v7}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v5

    .line 115
    .local v5, "ret":Ljava/lang/String;
    invoke-static {v5}, Lcom/beyond/BeyondBridge;->reformPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0

    .line 117
    .end local v5    # "ret":Ljava/lang/String;
    .end local v7    # "tm":Landroid/telephony/TelephonyManager;
    :cond_d
    const-string v8, "KEYPAD"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_e

    .line 118
    sget v8, Lcom/beyond/BeyondBridge;->KEYPAD:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0

    .line 120
    :cond_e
    const-string v8, "HD_KEYPAD_HIDDEN"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_f

    .line 121
    sget v8, Lcom/beyond/BeyondBridge;->HD_KEYPAD_HIDDEN:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0

    .line 123
    :cond_f
    const-string v8, "PRODUCT"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_10

    .line 124
    sget-object v5, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    goto/16 :goto_0

    .line 125
    :cond_10
    const-string v8, "main_class"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 126
    invoke-static {}, Lcom/beyond/BeyondBridge;->getMainClass()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0

    .line 135
    :cond_11
    const-string v8, "app_id"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_12

    .line 136
    invoke-static {p0}, Lcom/beyond/AppProperty;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0

    .line 138
    :cond_12
    const-string v8, "locale"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_13

    .line 139
    new-instance v3, Ljava/util/Locale;

    const-string v8, "KOREAN"

    invoke-direct {v3, v8}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    .line 140
    .local v3, "lc":Ljava/util/Locale;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v2

    .local v2, "language":Ljava/lang/String;
    move-object v5, v2

    .line 142
    goto/16 :goto_0

    .end local v2    # "language":Ljava/lang/String;
    .end local v3    # "lc":Ljava/util/Locale;
    :cond_13
    move-object v5, v0

    .line 145
    goto/16 :goto_0
.end method

.method public static declared-synchronized net_connect()I
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 188
    const-class v3, Lcom/beyond/BeyondBridge;

    monitor-enter v3

    :try_start_0
    sget-object v2, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    if-eqz v2, :cond_0

    .line 189
    new-instance v0, Lorg/kwis/msf/io/Message;

    const-string v2, "net_connect"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct {v0, v2, v4, v5, v6}, Lorg/kwis/msf/io/Message;-><init>(Ljava/lang/String;[BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    .local v0, "m":Lorg/kwis/msf/io/Message;
    :try_start_1
    sget-object v2, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    invoke-interface {v2, v0}, Lorg/kwis/msf/io/Socket;->recv(Lorg/kwis/msf/io/Message;)V

    .line 192
    invoke-virtual {v0}, Lorg/kwis/msf/io/Message;->getAddressInt()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    .line 203
    :goto_0
    monitor-exit v3

    return v1

    .line 200
    .end local v0    # "m":Lorg/kwis/msf/io/Message;
    :cond_0
    const/4 v1, 0x1

    goto :goto_0

    .line 188
    .restart local v0    # "m":Lorg/kwis/msf/io/Message;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    .line 195
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static declared-synchronized net_disconnect()V
    .locals 6

    .prologue
    .line 207
    const-class v2, Lcom/beyond/BeyondBridge;

    monitor-enter v2

    :try_start_0
    sget-object v1, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    if-eqz v1, :cond_0

    .line 208
    new-instance v0, Lorg/kwis/msf/io/Message;

    const-string v1, "net_disconnect"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct {v0, v1, v3, v4, v5}, Lorg/kwis/msf/io/Message;-><init>(Ljava/lang/String;[BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    .local v0, "m":Lorg/kwis/msf/io/Message;
    :try_start_1
    sget-object v1, Lcom/beyond/BeyondBridge;->carrier_socket:Lorg/kwis/msf/io/Socket;

    invoke-interface {v1, v0}, Lorg/kwis/msf/io/Socket;->recv(Lorg/kwis/msf/io/Message;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 216
    :cond_0
    :goto_0
    monitor-exit v2

    return-void

    .line 207
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1

    .line 211
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static openURL(Ljava/lang/String;)V
    .locals 3
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 233
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 234
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 235
    return-void
.end method

.method private static reformPhoneNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 149
    move-object v0, p0

    .line 150
    .local v0, "ret":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2b

    if-ne v1, v2, :cond_0

    .line 151
    const/4 v1, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 153
    :cond_0
    const-string v1, "82"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "0"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 157
    :cond_1
    return-object v0
.end method

.method public static setSystemProperty0(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p0, "command"    # Ljava/lang/String;
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x400

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 161
    const-string v2, "SENSOR_TRACKING"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 162
    const-string v2, "start"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 163
    sget-object v2, Lcom/beyond/JletActivity;->instance:Lcom/beyond/BeyondActivity;

    invoke-virtual {v2, v0, v1}, Lcom/beyond/BeyondActivity;->enableSensor(ZZ)Z

    .line 184
    :cond_0
    :goto_0
    return v0

    .line 165
    :cond_1
    const-string v2, "stop"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 166
    sget-object v2, Lcom/beyond/JletActivity;->instance:Lcom/beyond/BeyondActivity;

    invoke-virtual {v2, v1, v1}, Lcom/beyond/BeyondActivity;->enableSensor(ZZ)Z

    goto :goto_0

    .line 170
    :cond_2
    const-string v2, "KEYPAD"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 171
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    sput v1, Lcom/beyond/BeyondBridge;->KEYPAD:I

    goto :goto_0

    .line 174
    :cond_3
    const-string v2, "HD_KEYPAD_HIDDEN"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 175
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    sput v1, Lcom/beyond/BeyondBridge;->HD_KEYPAD_HIDDEN:I

    goto :goto_0

    .line 179
    :cond_4
    const-string v2, "FULLSCREEN_L"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 180
    sget-object v1, Lcom/beyond/JletActivity;->instance:Lcom/beyond/BeyondActivity;

    invoke-virtual {v1}, Lcom/beyond/BeyondActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v3, v3}, Landroid/view/Window;->setFlags(II)V

    goto :goto_0

    :cond_5
    move v0, v1

    .line 184
    goto :goto_0
.end method
