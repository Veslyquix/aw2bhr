	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800396C
sub_0800396C: @ 0x0800396C
	push {r4, r5, lr}
	ldr r5, _0800398C @ =gUnknown_03001FFC
	ldrh r0, [r5]
	adds r4, r0, #1
	cmp r4, #6
	ble _08003982
	movs r4, #6
	ldr r0, _08003990 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08003982:
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800398C: .4byte gUnknown_03001FFC
_08003990: .4byte gUnknown_03001FBC

