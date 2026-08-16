	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800CAA0
sub_0800CAA0: @ 0x0800CAA0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r4, #0
	movs r2, #0
	ldr r0, _0800CB08 @ =gUnknown_084888B0
	mov r8, r0
	ldr r3, _0800CB0C @ =gUnknown_03003FC0
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r5, [r0]
	movs r1, #0x37
	adds r1, r1, r3
	mov ip, r1
	ldr r7, _0800CB10 @ =gUnknown_084888D0
	mov sb, r7
	ldr r6, _0800CB14 @ =gUnknown_084888F0
_0800CAC4:
	mov r1, r8
	adds r0, r2, r1
	ldrb r0, [r0]
	lsrs r0, r0, #1
	cmp r0, r5
	bne _0800CB1C
	mov r7, sb
	adds r0, r2, r7
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x35
	lsrs r0, r0, #1
	ldrb r1, [r1]
	cmp r0, r1
	bne _0800CB1C
	adds r0, r2, r6
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x36
	lsrs r0, r0, #1
	ldrb r1, [r1]
	cmp r0, r1
	bne _0800CB1C
	ldr r0, _0800CB18 @ =gUnknown_08488900
	adds r0, #0x10
	adds r0, r2, r0
	ldrb r0, [r0]
	lsrs r0, r0, #1
	mov r1, ip
	ldrb r1, [r1]
	cmp r0, r1
	bne _0800CB1C
	adds r4, r2, #0
	b _0800CB22
	.align 2, 0
_0800CB08: .4byte gUnknown_084888B0
_0800CB0C: .4byte gUnknown_03003FC0
_0800CB10: .4byte gUnknown_084888D0
_0800CB14: .4byte gUnknown_084888F0
_0800CB18: .4byte gUnknown_08488900
_0800CB1C:
	adds r2, #1
	cmp r2, #0xf
	ble _0800CAC4
_0800CB22:
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

