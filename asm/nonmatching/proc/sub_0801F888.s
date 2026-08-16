	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801F888
sub_0801F888: @ 0x0801F888
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _0801F8E4 @ =gUnknown_085D3DD0
	ldr r1, _0801F8E8 @ =gUnknown_03003FC0
	mov ip, r1
	adds r0, #0x50
	mov sl, r0
	ldr r0, _0801F8EC @ =gUnknown_03004480
	mov sb, r0
	ldr r1, _0801F8F0 @ =gUnknown_08499598
	mov r8, r1
	ldr r7, _0801F8F4 @ =gUnknown_085D5ABC
_0801F8AA:
	ldr r1, _0801F8F8 @ =gUnknown_084999C8
	ldr r0, [r1]
	adds r5, r0, r4
	mov r3, ip
	adds r3, #0x2c
	mov r0, sb
	ldrh r1, [r0]
	mov r0, r8
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r2, r0, r2
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #4
	adds r0, r0, r1
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r3, r0, #2
	mov r1, ip
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _0801F8FC
	ldrb r1, [r2, #0x1d]
	lsls r0, r1, #6
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r3, r0
	b _0801F902
	.align 2, 0
_0801F8E4: .4byte gUnknown_085D3DD0
_0801F8E8: .4byte gUnknown_03003FC0
_0801F8EC: .4byte gUnknown_03004480
_0801F8F0: .4byte gUnknown_08499598
_0801F8F4: .4byte gUnknown_085D5ABC
_0801F8F8: .4byte gUnknown_084999C8
_0801F8FC:
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r3, r1
_0801F902:
	add r0, sl
	ldr r1, [r0]
	movs r0, #0x5c
	muls r0, r6, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #5
	adds r0, r4, r0
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r5]
	adds r4, #1
	cmp r4, #0x1f
	ble _0801F8AA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

