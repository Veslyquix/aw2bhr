	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058744
sub_08058744: @ 0x08058744
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _08058768 @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldr r4, _0805876C @ =gUnknown_030040D8
	ldr r1, [r4]
	ldrb r1, [r1]
	bl sub_08042D50
	cmp r0, #1
	bne _08058770
	ldr r0, [r4]
	bl sub_080202A4
	movs r0, #0x79
	bl sub_0801FD9C
	b _08058782
	.align 2, 0
_08058768: .4byte gUnknown_030033EC
_0805876C: .4byte gUnknown_030040D8
_08058770:
	movs r0, #0xff
	bl sub_0801F838
	ldr r2, [r4]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	bl sub_08020354
	movs r5, #1
_08058782:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

