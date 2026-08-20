.class public Lcom/beyond/screen/KeyCode;
.super Ljava/lang/Object;
.source "KeyCode.java"


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

.field public static final MH_KEY_DOWN:I = -0x2

.field static final MH_KEY_EARPIECE:I = -0x16

.field static final MH_KEY_END:I = -0xb

.field static final MH_KEY_FLIPDOWN:I = -0x11

.field static final MH_KEY_FLIPUP:I = -0x12

.field public static final MH_KEY_LEFT:I = -0x3

.field public static final MH_KEY_POUND:I = 0x23

.field static final MH_KEY_POWER:I = -0xc

.field public static final MH_KEY_RIGHT:I = -0x4

.field public static final MH_KEY_SELECT:I = -0x5

.field static final MH_KEY_SEND:I = -0xa

.field static final MH_KEY_SIDE_DOWN:I = -0xe

.field static final MH_KEY_SIDE_SEL:I = -0xf

.field static final MH_KEY_SIDE_UP:I = -0xd

.field static final MH_KEY_SOFT1:I = -0x6

.field static final MH_KEY_SOFT2:I = -0x7

.field static final MH_KEY_SOFT3:I = -0x8

.field public static final MH_KEY_UNKNOWN:I = 0x0

.field public static final MH_KEY_UP:I = -0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCode4String(Ljava/lang/String;)I
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 42
    if-nez p0, :cond_1

    .line 90
    :cond_0
    :goto_0
    return v0

    .line 44
    :cond_1
    const-string v1, "LEFT"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 45
    const/4 v0, -0x3

    goto :goto_0

    .line 46
    :cond_2
    const-string v1, "RIGHT"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 47
    const/4 v0, -0x4

    goto :goto_0

    .line 48
    :cond_3
    const-string v1, "UP"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 49
    const/4 v0, -0x1

    goto :goto_0

    .line 50
    :cond_4
    const-string v1, "DOWN"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 51
    const/4 v0, -0x2

    goto :goto_0

    .line 52
    :cond_5
    const-string v1, "OK"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 53
    const/4 v0, -0x5

    goto :goto_0

    .line 54
    :cond_6
    const-string v1, "CANCEL"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 55
    const/16 v0, -0x10

    goto :goto_0

    .line 56
    :cond_7
    const-string v1, "#"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 57
    const/16 v0, 0x23

    goto :goto_0

    .line 58
    :cond_8
    const-string v1, "*"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 59
    const/16 v0, 0x2a

    goto :goto_0

    .line 60
    :cond_9
    const-string v1, "SOFT1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 61
    const/4 v0, -0x6

    goto :goto_0

    .line 62
    :cond_a
    const-string v1, "SOFT2"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 63
    const/4 v0, -0x7

    goto :goto_0

    .line 64
    :cond_b
    const-string v1, "SOFT3"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 65
    const/4 v0, -0x8

    goto :goto_0

    .line 66
    :cond_c
    const-string v1, "0"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 67
    const/16 v0, 0x30

    goto :goto_0

    .line 68
    :cond_d
    const-string v1, "1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 69
    const/16 v0, 0x31

    goto/16 :goto_0

    .line 70
    :cond_e
    const-string v1, "2"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 71
    const/16 v0, 0x32

    goto/16 :goto_0

    .line 72
    :cond_f
    const-string v1, "3"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 73
    const/16 v0, 0x33

    goto/16 :goto_0

    .line 74
    :cond_10
    const-string v1, "4"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 75
    const/16 v0, 0x34

    goto/16 :goto_0

    .line 76
    :cond_11
    const-string v1, "5"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 77
    const/16 v0, 0x35

    goto/16 :goto_0

    .line 78
    :cond_12
    const-string v1, "6"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 79
    const/16 v0, 0x36

    goto/16 :goto_0

    .line 80
    :cond_13
    const-string v1, "7"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 81
    const/16 v0, 0x37

    goto/16 :goto_0

    .line 82
    :cond_14
    const-string v1, "8"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 83
    const/16 v0, 0x38

    goto/16 :goto_0

    .line 84
    :cond_15
    const-string v1, "9"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 85
    const/16 v0, 0x39

    goto/16 :goto_0

    .line 86
    :cond_16
    const-string v1, "SEND"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 87
    const/16 v0, -0xa

    goto/16 :goto_0

    .line 88
    :cond_17
    const-string v1, "END"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 89
    const/16 v0, -0xb

    goto/16 :goto_0
.end method

.method static getWipiTouchEvent(I)I
    .locals 1
    .param p0, "action"    # I

    .prologue
    .line 94
    const/4 v0, -0x1

    .line 96
    .local v0, "ret":I
    packed-switch p0, :pswitch_data_0

    .line 108
    :goto_0
    return v0

    .line 98
    :pswitch_0
    const/4 v0, 0x1

    .line 99
    goto :goto_0

    .line 101
    :pswitch_1
    const/4 v0, 0x2

    .line 102
    goto :goto_0

    .line 96
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
