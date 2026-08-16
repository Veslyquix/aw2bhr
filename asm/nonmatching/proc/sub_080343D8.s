	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080343D8
sub_080343D8: @ 0x080343D8
	push {lr}
	bl sub_08034598
	bl sub_0805FD64
	ldr r0, _080343F8 @ =gUnknown_03004780
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _080343F2
	ldr r1, _080343FC @ =gUnknown_03003F60
	movs r0, #0
	strh r0, [r1]
_080343F2:
	pop {r0}
	bx r0
	.align 2, 0
_080343F8: .4byte gUnknown_03004780
_080343FC: .4byte gUnknown_03003F60

