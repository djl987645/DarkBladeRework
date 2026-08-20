.class public Lcom/mobicle/darkblade/DarkBlade;
.super Lcom/beyond/CletActivity;
.source "DarkBlade.java"

# ============================================================
# [게임 진입점] com.mobicle.darkblade.DarkBlade
# - 2008년작, Beyond(컴투스 계열) CletActivity 프레임워크 상속
# - onCreate에서 효과음 목록(37개 ogg)을 구성해 부모로 전달
# - KT 결제 초기화(KTinitPurchase) 수행
# - ※ 본판 코드 — 수정 금지 (v0 방침)
# ============================================================

# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/beyond/CletActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    # 게임 시작: 사운드 배열 → CletActivity.onCreate(Bundle, String[]) → subCreate() → AppThread.start()
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 12
    const/16 v1, 0x25

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "snd/1.ogg"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "snd/2.ogg"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "snd/3.ogg"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    .line 13
    const-string v2, "snd/4.ogg"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "snd/5.ogg"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "snd/6.ogg"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "snd/8.ogg"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 14
    const-string v2, "snd/9.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "snd/10.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "snd/11.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "snd/12.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "snd/13.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 15
    const-string v2, "snd/14.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "snd/17.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "snd/18.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 16
    const-string v2, "snd/19.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "snd/20.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "snd/21.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "snd/22.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "snd/23.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 17
    const-string v2, "snd/24.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "snd/25.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "snd/26.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "snd/27.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "snd/28.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 18
    const-string v2, "snd/29.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "snd/30.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "snd/31.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "snd/32.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "snd/33.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    .line 19
    const-string v2, "snd/34.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "snd/35.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "snd/36.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "snd/37.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "snd/40.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    .line 20
    const-string v2, "snd/41.ogg"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "snd/42.ogg"

    aput-object v2, v0, v1

    .line 41
    .local v0, "effecSound":[Ljava/lang/String;
    invoke-super {p0, p1, v0}, Lcom/beyond/CletActivity;->onCreate(Landroid/os/Bundle;[Ljava/lang/String;)V

    .line 53
    const-string v1, "8100DA81"

    invoke-super {p0, v1}, Lcom/beyond/CletActivity;->KTinitPurchase(Ljava/lang/String;)V

    .line 55
    return-void
.end method
