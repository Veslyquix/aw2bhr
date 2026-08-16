	.include "macro.inc"
	.syntax unified

	thumb_func_start SoftReset
SoftReset: @ 0x0808AAD4
	ldr r3, _0808AAE4 @ =0x04000208
	movs r2, #0
	strb r2, [r3]
	ldr r1, _0808AAE8 @ =gUnknown_03007F00
	mov sp, r1
	svc #1
	svc #0
	movs r0, r0
	.align 2, 0
_0808AAE4: .4byte 0x04000208
_0808AAE8: .4byte gUnknown_03007F00

