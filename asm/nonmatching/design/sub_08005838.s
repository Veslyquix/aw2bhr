	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005838
sub_08005838: @ 0x08005838
	push {lr}
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #2
	bne _08005850
	ldr r0, _0800584C @ =gUnknown_08488594
	bl sub_080193B0
	b _08005868
	.align 2, 0
_0800584C: .4byte gUnknown_08488594
_08005850:
	ldr r0, _0800586C @ =gUnknown_0200B0B0
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #2]
	bl sub_0801A614
	bl sub_0801A168
	ldr r0, _08005870 @ =gUnknown_08488614
	movs r1, #0
	bl sub_080152C0
_08005868:
	pop {r0}
	bx r0
	.align 2, 0
_0800586C: .4byte gUnknown_0200B0B0
_08005870: .4byte gUnknown_08488614

