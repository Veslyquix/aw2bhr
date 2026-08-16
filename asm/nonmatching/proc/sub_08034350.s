	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034350
sub_08034350: @ 0x08034350
	push {lr}
	ldr r0, _08034368 @ =gUnknown_030040DC
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0803436C @ =gUnknown_03003F60
	ldrh r0, [r0]
	cmp r0, #0
	beq _08034370
	cmp r0, #4
	beq _08034376
	b _0803437A
	.align 2, 0
_08034368: .4byte gUnknown_030040DC
_0803436C: .4byte gUnknown_03003F60
_08034370:
	bl sub_08034394
	b _0803437A
_08034376:
	bl sub_080343D8
_0803437A:
	pop {r0}
	bx r0
	.align 2, 0

