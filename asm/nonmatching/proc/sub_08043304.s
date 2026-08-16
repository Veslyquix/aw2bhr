	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043304
sub_08043304: @ 0x08043304
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804333C @ =gUnknown_08499594
	ldr r1, [r4]
	ldr r0, [r0]
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	bl sub_08043050
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	beq _08043340
	movs r1, #6
	ldrsh r0, [r4, r1]
	lsls r0, r0, #1
	b _08043344
	.align 2, 0
_0804333C: .4byte gUnknown_08499594
_08043340:
	movs r1, #6
	ldrsh r0, [r4, r1]
_08043344:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

