.class public Lcom/beyond/DisplayBridge;
.super Ljava/lang/Object;
.source "DisplayBridge.java"


# static fields
.field static final MH_KEY_0:I = 0x30

.field static final MH_KEY_1:I = 0x31

.field static final MH_KEY_2:I = 0x32

.field static final MH_KEY_3:I = 0x33

.field static final MH_KEY_4:I = 0x34

.field static final MH_KEY_5:I = 0x35

.field static final MH_KEY_6:I = 0x36

.field static final MH_KEY_7:I = 0x37

.field static final MH_KEY_8:I = 0x38

.field static final MH_KEY_9:I = 0x39

.field static final MH_KEY_ASTERISK:I = 0x2a

.field static final MH_KEY_CAMERA:I = -0x13

.field static final MH_KEY_CLEAR:I = -0x10

.field static final MH_KEY_DOWN:I = -0x2

.field static final MH_KEY_EARPIECE:I = -0x16

.field static final MH_KEY_END:I = -0xb

.field static final MH_KEY_FLIPDOWN:I = -0x11

.field static final MH_KEY_FLIPUP:I = -0x12

.field static final MH_KEY_LEFT:I = -0x3

.field static final MH_KEY_POUND:I = 0x23

.field static final MH_KEY_POWER:I = -0xc

.field public static final MH_KEY_QUERTY_A:I = 0x64

.field public static final MH_KEY_QUERTY_Z:I = 0x7d

.field static final MH_KEY_RIGHT:I = -0x4

.field static final MH_KEY_SELECT:I = -0x5

.field static final MH_KEY_SEND:I = -0xa

.field static final MH_KEY_SIDE_DOWN:I = -0xe

.field static final MH_KEY_SIDE_SEL:I = -0xf

.field static final MH_KEY_SIDE_UP:I = -0xd

.field static final MH_KEY_SOFT1:I = -0x6

.field static final MH_KEY_SOFT2:I = -0x7

.field static final MH_KEY_SOFT3:I = -0x8

.field static final MH_KEY_UP:I = -0x1


# instance fields
.field protected m_h:I

.field protected m_w:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static calcFrameBufferBPL(III)I
    .locals 1
    .param p0, "screen"    # I
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 70
    const/4 v0, 0x0

    return v0
.end method

.method public static getGameAction0(I)I
    .locals 1
    .param p0, "key"    # I

    .prologue
    .line 169
    sparse-switch p0, :sswitch_data_0

    .line 215
    const/4 v0, -0x1

    :goto_0
    return v0

    .line 171
    :sswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 173
    :sswitch_1
    const/4 v0, 0x6

    goto :goto_0

    .line 175
    :sswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 177
    :sswitch_3
    const/4 v0, 0x5

    goto :goto_0

    .line 179
    :sswitch_4
    const/16 v0, 0x8

    goto :goto_0

    .line 181
    :sswitch_5
    const/16 v0, 0x9

    goto :goto_0

    .line 183
    :sswitch_6
    const/16 v0, 0xa

    goto :goto_0

    .line 185
    :sswitch_7
    const/16 v0, 0xb

    goto :goto_0

    .line 187
    :sswitch_8
    const/16 v0, 0xc

    goto :goto_0

    .line 189
    :sswitch_9
    const/16 v0, 0x5a

    goto :goto_0

    .line 191
    :sswitch_a
    const/16 v0, 0x5b

    goto :goto_0

    .line 193
    :sswitch_b
    const/16 v0, 0x5c

    goto :goto_0

    .line 195
    :sswitch_c
    const/16 v0, 0x60

    goto :goto_0

    .line 197
    :sswitch_d
    const/16 v0, 0x61

    goto :goto_0

    .line 199
    :sswitch_e
    const/16 v0, 0x62

    goto :goto_0

    .line 201
    :sswitch_f
    const/16 v0, 0x63

    goto :goto_0

    .line 213
    :sswitch_10
    const/4 v0, 0x0

    goto :goto_0

    .line 169
    nop

    :sswitch_data_0
    .sparse-switch
        -0x10 -> :sswitch_f
        -0xf -> :sswitch_e
        -0xe -> :sswitch_d
        -0xd -> :sswitch_c
        -0xc -> :sswitch_10
        -0xb -> :sswitch_10
        -0xa -> :sswitch_10
        -0x8 -> :sswitch_b
        -0x7 -> :sswitch_a
        -0x6 -> :sswitch_9
        -0x5 -> :sswitch_4
        -0x4 -> :sswitch_3
        -0x3 -> :sswitch_2
        -0x2 -> :sswitch_1
        -0x1 -> :sswitch_0
        0x23 -> :sswitch_8
        0x2a -> :sswitch_7
        0x30 -> :sswitch_10
        0x31 -> :sswitch_10
        0x32 -> :sswitch_10
        0x33 -> :sswitch_10
        0x34 -> :sswitch_10
        0x35 -> :sswitch_10
        0x36 -> :sswitch_10
        0x37 -> :sswitch_5
        0x38 -> :sswitch_10
        0x39 -> :sswitch_6
    .end sparse-switch
.end method

.method public static getKeyCode0(I)I
    .locals 1
    .param p0, "gameKey"    # I

    .prologue
    .line 75
    const/4 v0, 0x0

    .line 77
    .local v0, "keyCode":I
    sparse-switch p0, :sswitch_data_0

    .line 128
    :goto_0
    return v0

    .line 79
    :sswitch_0
    const/4 v0, -0x1

    .line 80
    goto :goto_0

    .line 82
    :sswitch_1
    const/4 v0, -0x2

    .line 83
    goto :goto_0

    .line 85
    :sswitch_2
    const/4 v0, -0x3

    .line 86
    goto :goto_0

    .line 88
    :sswitch_3
    const/4 v0, -0x4

    .line 89
    goto :goto_0

    .line 91
    :sswitch_4
    const/4 v0, -0x5

    .line 92
    goto :goto_0

    .line 94
    :sswitch_5
    const/16 v0, 0x37

    .line 95
    goto :goto_0

    .line 97
    :sswitch_6
    const/16 v0, 0x39

    .line 98
    goto :goto_0

    .line 100
    :sswitch_7
    const/16 v0, 0x2a

    .line 101
    goto :goto_0

    .line 103
    :sswitch_8
    const/16 v0, 0x23

    .line 104
    goto :goto_0

    .line 106
    :sswitch_9
    const/4 v0, -0x6

    .line 107
    goto :goto_0

    .line 109
    :sswitch_a
    const/4 v0, -0x7

    .line 110
    goto :goto_0

    .line 112
    :sswitch_b
    const/4 v0, -0x8

    .line 113
    goto :goto_0

    .line 115
    :sswitch_c
    const/16 v0, -0xd

    .line 116
    goto :goto_0

    .line 118
    :sswitch_d
    const/16 v0, -0xe

    .line 119
    goto :goto_0

    .line 121
    :sswitch_e
    const/16 v0, -0xf

    .line 122
    goto :goto_0

    .line 124
    :sswitch_f
    const/16 v0, -0x10

    goto :goto_0

    .line 77
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_2
        0x5 -> :sswitch_3
        0x6 -> :sswitch_1
        0x8 -> :sswitch_4
        0x9 -> :sswitch_5
        0xa -> :sswitch_6
        0xb -> :sswitch_7
        0xc -> :sswitch_8
        0x5a -> :sswitch_9
        0x5b -> :sswitch_a
        0x5c -> :sswitch_b
        0x60 -> :sswitch_c
        0x61 -> :sswitch_d
        0x62 -> :sswitch_e
        0x63 -> :sswitch_f
    .end sparse-switch
.end method

.method public static getKeyName0(I)Ljava/lang/String;
    .locals 1
    .param p0, "keyCode"    # I

    .prologue
    .line 132
    sparse-switch p0, :sswitch_data_0

    .line 161
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 134
    :sswitch_0
    const-string v0, "POWER"

    goto :goto_0

    .line 135
    :sswitch_1
    const-string v0, "SEND"

    goto :goto_0

    .line 136
    :sswitch_2
    const-string v0, "END"

    goto :goto_0

    .line 137
    :sswitch_3
    const-string v0, "SOFT1"

    goto :goto_0

    .line 138
    :sswitch_4
    const-string v0, "SOFT2"

    goto :goto_0

    .line 139
    :sswitch_5
    const-string v0, "SOFT3"

    goto :goto_0

    .line 140
    :sswitch_6
    const-string v0, "UP"

    goto :goto_0

    .line 141
    :sswitch_7
    const-string v0, "DOWN"

    goto :goto_0

    .line 142
    :sswitch_8
    const-string v0, "LEFT"

    goto :goto_0

    .line 143
    :sswitch_9
    const-string v0, "RIGHT"

    goto :goto_0

    .line 144
    :sswitch_a
    const-string v0, "SELECT"

    goto :goto_0

    .line 145
    :sswitch_b
    const-string v0, "1"

    goto :goto_0

    .line 146
    :sswitch_c
    const-string v0, "2"

    goto :goto_0

    .line 147
    :sswitch_d
    const-string v0, "3"

    goto :goto_0

    .line 148
    :sswitch_e
    const-string v0, "4"

    goto :goto_0

    .line 149
    :sswitch_f
    const-string v0, "5"

    goto :goto_0

    .line 150
    :sswitch_10
    const-string v0, "6"

    goto :goto_0

    .line 151
    :sswitch_11
    const-string v0, "7"

    goto :goto_0

    .line 152
    :sswitch_12
    const-string v0, "8"

    goto :goto_0

    .line 153
    :sswitch_13
    const-string v0, "9"

    goto :goto_0

    .line 154
    :sswitch_14
    const-string v0, "0"

    goto :goto_0

    .line 155
    :sswitch_15
    const-string v0, "POUND"

    goto :goto_0

    .line 156
    :sswitch_16
    const-string v0, "ASTERISK"

    goto :goto_0

    .line 157
    :sswitch_17
    const-string v0, "SIDE_UP"

    goto :goto_0

    .line 158
    :sswitch_18
    const-string v0, "SIDE_DOWN"

    goto :goto_0

    .line 159
    :sswitch_19
    const-string v0, "SIDE_SEL"

    goto :goto_0

    .line 160
    :sswitch_1a
    const-string v0, "CLEAR"

    goto :goto_0

    .line 132
    :sswitch_data_0
    .sparse-switch
        -0x10 -> :sswitch_1a
        -0xf -> :sswitch_19
        -0xe -> :sswitch_18
        -0xd -> :sswitch_17
        -0xc -> :sswitch_0
        -0xb -> :sswitch_2
        -0xa -> :sswitch_1
        -0x8 -> :sswitch_5
        -0x7 -> :sswitch_4
        -0x6 -> :sswitch_3
        -0x5 -> :sswitch_a
        -0x4 -> :sswitch_9
        -0x3 -> :sswitch_8
        -0x2 -> :sswitch_7
        -0x1 -> :sswitch_6
        0x23 -> :sswitch_15
        0x2a -> :sswitch_16
        0x30 -> :sswitch_14
        0x31 -> :sswitch_b
        0x32 -> :sswitch_c
        0x33 -> :sswitch_d
        0x34 -> :sswitch_e
        0x35 -> :sswitch_f
        0x36 -> :sswitch_10
        0x37 -> :sswitch_11
        0x38 -> :sswitch_12
        0x39 -> :sswitch_13
    .end sparse-switch
.end method

.method public static hideSwip()V
    .locals 2

    .prologue
    .line 300
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    if-eqz v0, :cond_0

    .line 301
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/beyond/InputBox;->objListener:Lcom/beyond/util/ObjectListener;

    .line 302
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/beyond/InputBox;->isNeedReset:Z

    .line 303
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/beyond/InputBox;->_isReturnPressed:Z

    .line 307
    :cond_0
    return-void
.end method

.method public static setSwipConstraint(I)V
    .locals 1
    .param p0, "CONSTRAINT"    # I

    .prologue
    .line 293
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    if-eqz v0, :cond_0

    .line 294
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    invoke-virtual {v0, p0}, Lcom/beyond/InputBox;->setConstraint(I)V

    .line 296
    :cond_0
    return-void
.end method

.method public static setSwipLitener(Lcom/beyond/util/ObjectListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/beyond/util/ObjectListener;

    .prologue
    .line 288
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    if-eqz v0, :cond_0

    .line 289
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    iput-object p0, v0, Lcom/beyond/InputBox;->objListener:Lcom/beyond/util/ObjectListener;

    .line 291
    :cond_0
    return-void
.end method

.method public static setSwipMaxLength(I)V
    .locals 4
    .param p0, "maxLength"    # I

    .prologue
    .line 282
    if-lez p0, :cond_0

    .line 283
    sget-object v0, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/text/InputFilter;

    const/4 v2, 0x0

    .line 284
    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    invoke-direct {v3, p0}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v3, v1, v2

    .line 283
    invoke-virtual {v0, v1}, Lcom/beyond/InputBox;->setFilters([Landroid/text/InputFilter;)V

    .line 285
    :cond_0
    return-void
.end method

.method public static setSwipPosition(I)V
    .locals 2
    .param p0, "position"    # I

    .prologue
    .line 275
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 276
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x66

    iput v1, v0, Landroid/os/Message;->what:I

    .line 277
    iput p0, v0, Landroid/os/Message;->arg1:I

    .line 278
    sget-object v1, Lcom/beyond/JletActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 279
    return-void
.end method

.method public static setSwipText(Ljava/lang/String;)V
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 268
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 269
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x65

    iput v1, v0, Landroid/os/Message;->what:I

    .line 270
    iput-object p0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 271
    sget-object v1, Lcom/beyond/JletActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 272
    return-void
.end method

.method public static showSwip(Ljava/lang/String;II[B)I
    .locals 5
    .param p0, "initString"    # Ljava/lang/String;
    .param p1, "maxLength"    # I
    .param p2, "constraint"    # I
    .param p3, "resultString"    # [B

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 250
    sget-object v2, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    if-nez v2, :cond_0

    .line 261
    :goto_0
    return v0

    .line 253
    :cond_0
    if-lez p1, :cond_1

    .line 254
    sget-object v2, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    new-array v3, v1, [Landroid/text/InputFilter;

    .line 255
    new-instance v4, Landroid/text/InputFilter$LengthFilter;

    invoke-direct {v4, p1}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v4, v3, v0

    .line 254
    invoke-virtual {v2, v3}, Lcom/beyond/InputBox;->setFilters([Landroid/text/InputFilter;)V

    .line 257
    :cond_1
    sget-object v2, Lcom/beyond/JletActivity;->jf:Lcom/beyond/InputBox;

    iput-boolean v0, v2, Lcom/beyond/InputBox;->_isReturnPressed:Z

    move v0, v1

    .line 261
    goto :goto_0
.end method


# virtual methods
.method public getAnnunciatorHeight()I
    .locals 1

    .prologue
    .line 235
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v0

    iget v0, v0, Lcom/beyond/screen/AnnunInfo;->height:I

    return v0
.end method

.method getDisHeight()I
    .locals 1

    .prologue
    .line 65
    iget v0, p0, Lcom/beyond/DisplayBridge;->m_h:I

    return v0
.end method

.method getDisWidth()I
    .locals 1

    .prologue
    .line 61
    iget v0, p0, Lcom/beyond/DisplayBridge;->m_w:I

    return v0
.end method

.method protected isShownAnnun()Z
    .locals 1

    .prologue
    .line 240
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v0

    iget v0, v0, Lcom/beyond/screen/AnnunInfo;->height:I

    if-lez v0, :cond_0

    .line 241
    const/4 v0, 0x1

    .line 242
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public showAnnunciator()V
    .locals 4

    .prologue
    .line 220
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v2

    iget v2, v2, Lcom/beyond/screen/AnnunInfo;->height:I

    if-lez v2, :cond_1

    .line 232
    :cond_0
    :goto_0
    return-void

    .line 222
    :cond_1
    const-string v2, "wipi_annun_height"

    invoke-static {v2}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 223
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 226
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v2, Lcom/beyond/screen/AnnunInfo;->height:I

    .line 228
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 229
    .local v0, "msg":Landroid/os/Message;
    const/16 v2, 0x78

    iput v2, v0, Landroid/os/Message;->what:I

    .line 230
    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 231
    sget-object v2, Lcom/beyond/JletActivity;->handler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
