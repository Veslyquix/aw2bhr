	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080230DC
sub_080230DC: @ 0x080230DC
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r2, _08023100 @ =gUnknown_080909E8
	ldr r1, [r2]
	ldrh r3, [r1]
	ldrh r4, [r1, #2]
	lsrs r5, r0, #0x10
	asrs r1, r0, #0x10
	subs r0, r1, r3
	mov ip, r2
	cmp r0, #0
	blt _08023104
	cmp r0, #0
	bgt _0802310A
	b _08023120
	.align 2, 0
_08023100: .4byte gUnknown_080909E8
_08023104:
	subs r0, r3, r1
	cmp r0, #0
	ble _08023120
_0802310A:
	cmp r0, #1
	bne _08023112
	adds r3, r5, #0
	b _08023120
_08023112:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r3
	asrs r0, r0, #1
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08023120:
	lsls r0, r6, #0x10
	asrs r2, r0, #0x10
	subs r1, r2, r4
	adds r5, r0, #0
	cmp r1, #0
	blt _08023132
	cmp r1, #0
	bgt _0802313E
	b _08023152
_08023132:
	subs r0, r4, r2
	cmp r0, #0
	ble _08023152
	cmp r0, #1
	bne _08023146
	b _08023142
_0802313E:
	cmp r1, #1
	bne _08023146
_08023142:
	lsrs r4, r5, #0x10
	b _08023152
_08023146:
	asrs r0, r5, #0x10
	subs r0, r0, r4
	asrs r0, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_08023152:
	mov r1, ip
	ldr r0, [r1]
	strh r3, [r0]
	strh r4, [r0, #2]
	strh r3, [r7]
	ldr r0, [sp, #0x14]
	strh r4, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

