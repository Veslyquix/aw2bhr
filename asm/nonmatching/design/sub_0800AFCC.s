	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800AFCC
sub_0800AFCC: @ 0x0800AFCC
	push {r4, lr}
	ldr r2, _0800AFFC @ =gUnknown_08499590
	ldr r3, [r2]
	lsls r1, r1, #1
	ldr r4, _0800B000 @ =0x0000417A
	adds r2, r3, r4
	adds r2, r2, r1
	ldrh r1, [r2]
	adds r1, r1, r0
	ldr r0, _0800B004 @ =0x00001432
	adds r3, r3, r0
	adds r3, r3, r1
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	subs r0, #3
	cmp r0, #0xb
	bhi _0800B040
	lsls r0, r0, #2
	ldr r1, _0800B008 @ =_0800B00C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800AFFC: .4byte gUnknown_08499590
_0800B000: .4byte 0x0000417A
_0800B004: .4byte 0x00001432
_0800B008: .4byte _0800B00C
_0800B00C: @ jump table
	.4byte _0800B03C @ case 0
	.4byte _0800B03C @ case 1
	.4byte _0800B040 @ case 2
	.4byte _0800B03C @ case 3
	.4byte _0800B040 @ case 4
	.4byte _0800B03C @ case 5
	.4byte _0800B040 @ case 6
	.4byte _0800B03C @ case 7
	.4byte _0800B03C @ case 8
	.4byte _0800B040 @ case 9
	.4byte _0800B040 @ case 10
	.4byte _0800B03C @ case 11
_0800B03C:
	movs r0, #1
	b _0800B042
_0800B040:
	movs r0, #0
_0800B042:
	pop {r4}
	pop {r1}
	bx r1

