	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802E6F8
sub_0802E6F8: @ 0x0802E6F8
	push {lr}
	ldr r1, _0802E71C @ =gUnknown_03003100
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl sub_08022AAC
	bl sub_08034F48
	bl sub_080424FC
	ldr r1, _0802E720 @ =gUnknown_03003334
	movs r0, #0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802E71C: .4byte gUnknown_03003100
_0802E720: .4byte gUnknown_03003334

