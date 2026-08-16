	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802F03C
sub_0802F03C: @ 0x0802F03C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0802F1F8 @ =gUnknown_0300333C
	movs r1, #0
	str r1, [r0]
	ldr r3, _0802F1FC @ =gUnknown_0849B018
	ldr r0, [r3]
	ldrh r2, [r0, #0x20]
	movs r2, #0
	strh r1, [r0, #0x20]
	ldrh r4, [r0, #0x22]
	strh r1, [r0, #0x22]
	ldr r1, _0802F200 @ =0x00001AAC
	adds r0, r0, r1
	ldrb r1, [r0]
	strb r2, [r0]
	ldr r0, [r3]
	ldr r7, _0802F204 @ =0x00001AAD
	adds r0, r0, r7
	ldrb r1, [r0]
	strb r2, [r0]
	ldr r0, [r3]
	ldr r1, _0802F208 @ =0x00001AAE
	adds r0, r0, r1
	ldrb r1, [r0]
	strb r2, [r0]
	ldr r0, [r3]
	adds r7, #2
	adds r0, r0, r7
	ldrb r1, [r0]
	strb r2, [r0]
	ldr r0, [r3]
	ldrb r1, [r0, #0x1a]
	strb r2, [r0, #0x1a]
	ldr r0, [r3]
	ldrb r1, [r0, #0x1b]
	strb r2, [r0, #0x1b]
	ldr r0, [r3]
	ldrb r1, [r0, #0x1f]
	strb r2, [r0, #0x1f]
	movs r4, #0
	mov sl, r3
	movs r6, #0
	ldr r0, _0802F20C @ =gUnknown_0849B01C
	mov r8, r0
	ldr r1, _0802F210 @ =0x0000FFFF
	mov ip, r1
	movs r3, #0
	ldr r2, _0802F214 @ =gUnknown_0300449C
	mov sb, r2
_0802F0A6:
	mov r7, sl
	ldr r0, [r7]
	adds r0, #0xa
	adds r0, r0, r4
	ldrb r1, [r0]
	strb r6, [r0]
	ldr r0, [r7]
	adds r0, #0x16
	adds r0, r0, r4
	ldrb r1, [r0]
	strb r6, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0xe
	adds r0, r0, r3
	ldrh r2, [r0]
	strh r6, [r0]
	adds r1, #0x24
	adds r1, r1, r3
	ldrh r0, [r1]
	strh r6, [r1]
	adds r2, r3, #0
	movs r5, #0x3f
_0802F0D4:
	mov r0, r8
	ldr r1, [r0]
	adds r1, #8
	adds r1, r1, r2
	ldrh r0, [r1]
	mov r7, ip
	orrs r0, r7
	strh r0, [r1]
	adds r2, #8
	subs r5, #1
	cmp r5, #0
	bge _0802F0D4
	mov r0, r8
	ldr r1, [r0]
	movs r2, #0x82
	lsls r2, r2, #2
	adds r1, r1, r2
	adds r1, r1, r3
	ldrh r0, [r1]
	orrs r0, r7
	strh r0, [r1]
	ldrh r0, [r1]
	ldrh r2, [r1]
	strh r0, [r1]
	mov r1, sb
	adds r0, r4, r1
	ldrb r1, [r0]
	strb r6, [r0]
	adds r3, #2
	adds r4, #1
	cmp r4, #3
	ble _0802F0A6
	movs r4, #0
	ldr r5, _0802F218 @ =gUnknown_03004400
	movs r2, #0
	ldr r3, _0802F1FC @ =gUnknown_0849B018
_0802F11C:
	adds r0, r4, r5
	ldrb r1, [r0]
	strb r2, [r0]
	ldr r0, [r3]
	lsls r1, r4, #1
	adds r0, #0x2c
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r2, [r0]
	adds r4, #1
	cmp r4, #0x7f
	ble _0802F11C
	ldr r7, _0802F1FC @ =gUnknown_0849B018
	movs r3, #0
	movs r2, #0
	movs r6, #0x96
	lsls r6, r6, #1
	movs r5, #0x1f
_0802F140:
	adds r1, r2, r6
	ldr r0, [r7]
	adds r0, r0, r1
	strb r3, [r0]
	movs r4, #0x7f
	adds r0, #0x85
_0802F14C:
	strb r3, [r0]
	subs r0, #1
	subs r4, #1
	cmp r4, #0
	bge _0802F14C
	adds r2, #0x88
	subs r5, #1
	cmp r5, #0
	bge _0802F140
	movs r5, #0
	ldr r7, _0802F1FC @ =gUnknown_0849B018
	movs r2, #0
	ldr r6, _0802F21C @ =0x0000122C
_0802F166:
	lsls r0, r5, #4
	adds r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r1, [r7]
	adds r1, r1, r0
	strb r2, [r1]
	adds r3, r5, #1
	movs r4, #0x7f
	adds r1, #0x85
_0802F17A:
	strb r2, [r1]
	subs r1, #1
	subs r4, #1
	cmp r4, #0
	bge _0802F17A
	adds r5, r3, #0
	cmp r5, #0xf
	ble _0802F166
	ldr r2, _0802F220 @ =gUnknown_030040CC
	ldr r1, _0802F224 @ =gUnknown_0300410C
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1]
	strh r0, [r2]
	movs r2, #0
	ldr r1, _0802F228 @ =gUnknown_02025818
	movs r4, #0x80
	lsls r4, r4, #2
_0802F19E:
	ldrh r0, [r1]
	strh r2, [r1]
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _0802F19E
	movs r5, #0
	ldr r2, _0802F22C @ =gUnknown_03003128
	mov sb, r2
	ldr r7, _0802F230 @ =gUnknown_03003F48
	mov ip, r7
	movs r6, #0
	ldr r0, _0802F234 @ =0x000003FF
	mov r8, r0
	ldr r7, _0802F238 @ =gUnknown_02025C18
_0802F1BC:
	lsls r2, r5, #1
	mov r1, sb
	adds r3, r2, r1
	mov r1, ip
	adds r0, r2, r1
	ldrh r1, [r0]
	strh r6, [r0]
	ldrh r0, [r0]
	ldrh r1, [r3]
	strh r0, [r3]
	adds r3, r5, #1
	adds r2, r2, r7
	mov r4, r8
	adds r4, #1
_0802F1D8:
	ldrh r0, [r2]
	strh r6, [r2]
	adds r2, #8
	subs r4, #1
	cmp r4, #0
	bne _0802F1D8
	adds r5, r3, #0
	cmp r5, #3
	ble _0802F1BC
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F1F8: .4byte gUnknown_0300333C
_0802F1FC: .4byte gUnknown_0849B018
_0802F200: .4byte 0x00001AAC
_0802F204: .4byte 0x00001AAD
_0802F208: .4byte 0x00001AAE
_0802F20C: .4byte gUnknown_0849B01C
_0802F210: .4byte 0x0000FFFF
_0802F214: .4byte gUnknown_0300449C
_0802F218: .4byte gUnknown_03004400
_0802F21C: .4byte 0x0000122C
_0802F220: .4byte gUnknown_030040CC
_0802F224: .4byte gUnknown_0300410C
_0802F228: .4byte gUnknown_02025818
_0802F22C: .4byte gUnknown_03003128
_0802F230: .4byte gUnknown_03003F48
_0802F234: .4byte 0x000003FF
_0802F238: .4byte gUnknown_02025C18

