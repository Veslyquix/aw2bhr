	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A718
sub_0801A718: @ 0x0801A718
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r0, _0801A734 @ =gUnknown_0808E5CC
	ldr r2, [r0]
	movs r5, #0
	ldrsh r1, [r2, r5]
	mov ip, r0
	cmp r1, #0x80
	ble _0801A73E
	movs r0, #1
	rsbs r0, r0, #0
	b _0801A794
	.align 2, 0
_0801A734: .4byte gUnknown_0808E5CC
_0801A738:
	str r2, [r5, #4]
	str r3, [r2, #4]
	b _0801A782
_0801A73E:
	movs r7, #0
	ldrsh r0, [r2, r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801A75C @ =gUnknown_0200C624
	adds r2, r1, r0
	str r3, [r2]
	strh r4, [r2, #8]
	adds r3, r0, #0
	subs r3, #0xc
	movs r5, #0
	lsls r4, r4, #0x10
	ldr r6, _0801A760 @ =gUnknown_0808E5D0
	b _0801A768
	.align 2, 0
_0801A75C: .4byte gUnknown_0200C624
_0801A760: .4byte gUnknown_0808E5D0
_0801A764:
	adds r5, r3, #0
	adds r3, r0, #0
_0801A768:
	asrs r1, r4, #0x10
	movs r7, #8
	ldrsh r0, [r3, r7]
	cmp r1, r0
	bgt _0801A778
	str r3, [r2, #4]
	cmp r5, #0
	bne _0801A738
_0801A778:
	ldr r0, [r3, #4]
	cmp r0, #0
	bne _0801A764
	str r0, [r2, #4]
	str r2, [r3, #4]
_0801A782:
	mov r0, ip
	ldr r1, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, [r6]
	ldr r0, [r0, #4]
	str r0, [r1, #4]
	movs r0, #0
_0801A794:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

