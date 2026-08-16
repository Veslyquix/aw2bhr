	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078918
sub_08078918: @ 0x08078918
	ldr r0, _08078950 @ =gUnknown_0202FDFC
	mov ip, r0
	adds r0, #0x22
	ldrb r0, [r0]
	movs r1, #2
	adds r2, r1, #0
	ands r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r1, #0
	ands r0, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r2, r0
	mov r0, ip
	adds r0, #0x24
	ldrb r0, [r0]
	ands r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmn r2, r1
	bne _08078954
	movs r0, #1
	b _08078956
	.align 2, 0
_08078950: .4byte gUnknown_0202FDFC
_08078954:
	movs r0, #0
_08078956:
	bx lr

