.class public interface abstract Lorg/kwis/msf/io/Serial;
.super Ljava/lang/Object;
.source "Serial.java"


# static fields
.field public static final BAUDRATE:I = 0x1

.field public static final CD:I = 0x4

.field public static final CTS:I = 0x1

.field public static final DATABIT:I = 0x2

.field public static final DATABIT_5:I = 0x5

.field public static final DATABIT_6:I = 0x6

.field public static final DATABIT_7:I = 0x7

.field public static final DATABIT_8:I = 0x8

.field public static final DSR:I = 0x2

.field public static final DTR:I = 0x5

.field public static final EVENPARITY:I = 0x2

.field public static final GET_PIN_STATUS:I = 0x4

.field public static final GET_PORT_STATUS:I = 0x2

.field public static final MARKPARITY:I = 0x3

.field public static final NOPARITY:I = 0x0

.field public static final ODDPARITY:I = 0x1

.field public static final ONE5STOPBITS:I = 0x1

.field public static final ONESTOPBIT:I = 0x0

.field public static final PARITYBIT:I = 0x3

.field public static final RI:I = 0x3

.field public static final RTS:I = 0x6

.field public static final SET_PIN_STATUS:I = 0x3

.field public static final SET_PORT_STATUS:I = 0x1

.field public static final SET_USERCMD:I = 0xff

.field public static final SPACEPARITY:I = 0x4

.field public static final STOPBIT:I = 0x4

.field public static final TWOSTOPBITS:I = 0x2


# virtual methods
.method public abstract control(ILjava/lang/Object;Ljava/lang/Object;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
