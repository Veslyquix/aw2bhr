	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801A6C0
sub_0801A6C0: @ 0x0801A6C0
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, _0801A6F8 @ =gUnknown_0808E5C8
	ldr r4, [r5]
	movs r3, #0
_0801A6CA:
	lsls r2, r1, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r4
	str r3, [r1]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #0x80
	ble _0801A6CA
	ldr r1, _0801A6FC @ =gUnknown_030020A8
	movs r2, #0
	str r2, [r1, #4]
	strh r2, [r1]
	ldr r1, [r5]
	str r2, [r1, #4]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801A6F8: .4byte gUnknown_0808E5C8
_0801A6FC: .4byte gUnknown_030020A8

