	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067564
sub_08067564: @ 0x08067564
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _08067574
	subs r0, #1
	str r0, [r4, #0x60]
	b _08067594
_08067574:
	ldr r0, _0806759C @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08067594
	bl sub_0803B5E8
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08067594:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806759C: .4byte gpKeySt

