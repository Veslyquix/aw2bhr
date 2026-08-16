	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080399D8
sub_080399D8: @ 0x080399D8
	ldr r3, _080399F0 @ =gUnknown_03001FF8
	ldr r2, [r0, #0x2c]
	ldrh r1, [r3]
	adds r1, r1, r2
	strh r1, [r3]
	ldr r2, _080399F4 @ =gUnknown_03001418
	ldr r1, [r0, #0x30]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080399F0: .4byte gUnknown_03001FF8
_080399F4: .4byte gUnknown_03001418

